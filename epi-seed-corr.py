#!/usr/bin/env python
"""
Produces a correlation map of the mean time series within the seed with
every voxel in the supplied mask. This function assumes all supplied
images are the same size.
Usage:
    epi-seed-corr [options] <func> <seed> <mask> <output>	

Arguments:
    <func>          functional data
    <seed>          seed mask
    <mask>          brain mask
    <output>        output name (no extension, .nifti.gz output manditory)
Options:
    --weighted         compute weighted average timeseries from the seed map
    --use-TRs FILE     Only use the TRs listed in the file provided (TR's in file starts with 1)
    --output-ts        Also output write the from the seed to text
DETAILS:
    At the moment, the seed mask only works with a single seed (all nonzero
    voxels will be pooled.) This outputs a single image with the r-values.
"""

import sys
import numpy as np
import scipy as sp
import nibabel as nib
from epitome.docopt import docopt

def main():
    arguments = docopt(__doc__)
    func   = arguments['<func>']
    seed   = arguments['<seed>']
    mask   = arguments['<mask>']
    output = arguments['<output>']
    weighted = arguments['--weighted']
    TR_file = arguments['--use-TRs']
    output_ts = arguments['--output-ts']

    # check types
    output = str(output)

    # determine the filenames
    if func[-7:] == '.nii.gz':
        funcname = func[:-7]
    elif func[-4:] == '.nii' or func[-4:] == '.mnc':
        funcname = func[:-4]

    if seed[-7:] == '.nii.gz':
        seedname = seed[:-7]
    elif seed[-4:] == '.nii' or seed[-4:] == '.mnc':
        seedname = seed[:-4]

    # set output name: remove .nii.gz or .nii ext from output name if given
    if output == None:
        output = 'corr_{}_{}'.format(seedname, funcname)
    if output[-7:] == '.nii.gz':
        output = output[:-7]
    elif output[-4:] == '.nii' or output[-4:] == '.mnc':
        output = output[:-4]

    # import template, store the output paramaters
    seed = nib.load(seed)
    outA = seed.get_affine()

    # import data
    seed = seed.get_data()
    func = nib.load(func).get_data()
    mask = nib.load(mask).get_data()

    # move to 2D
    dims = func.shape
    func = func.reshape((dims[0]*dims[1]*dims[2], dims[3]))
    seed = seed.reshape((dims[0]*dims[1]*dims[2], 1))
    mask = mask.reshape((dims[0]*dims[1]*dims[2], 1))

    # decide which TRs go into the correlation
    if TR_file:
        TR_file = np.loadtxt(TR_file, int)
        TRs = TR_file - 1 # shift TR-list to be zero-indexed
    else:
        TRs = np.arange(dims[3])

    # get mean seed timeseries
    idx_mask = np.where(mask >= 1)[0]
    seed[np.where(mask >= 1)[1]] = 0

    # calculate weight mask if required
    if weighted:
        seed_ts = np.average(func, axis=0,
            weights=seed.reshape((dims[0]*dims[1]*dims[2])))
    else:
        idx_seed = np.where(seed >= 1)[0]
        seed_ts = np.mean(func[idx_seed, :], axis=0)

    # create output array
    out = np.zeros([dims[0]*dims[1]*dims[2], 1])

    # look through each time series, calculating r
    for i in np.arange(len(idx_mask)):
        out[idx_mask[i]] = np.corrcoef(seed_ts[TRs], func[idx_mask[i], TRs])[0][1]

    # create the 3D volume and export
    out = out.reshape([dims[0], dims[1], dims[2], 1])
    out = nib.nifti1.Nifti1Image(out, outA)

    # write out the ts if asked
    if output_ts:
        np.savetxt('{}_ts.txt'.format(output), seed_ts)

    # write out nifti
    out.to_filename('{}.nii.gz'.format(output))

if __name__ == '__main__':
    main()
