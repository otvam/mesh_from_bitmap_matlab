function c_cell = contour_create(img, scale)
%CONTOUR_CREATE Extract contours from an image taking the holes into account.
%   c_cell = CONTOUR_CREATE(img, scale)
%   img - binary image with the contour information (matrix)
%   scale - size per pixel of the image (scalar)
%   c_cell - cell array with the contours (cell of matrix)
%
%   See also CONTOUR_SIMPLIFY, BWBOUNDARIES.

%   Thomas Guillod.
%   2020 - BSD License.

% find boundary
bnd = bwboundaries(img);

% parse the contours
for i=1:length(bnd)
    bnd_tmp = bnd{i};
    assert(all(bnd_tmp(1,:)==bnd_tmp(end,:)), 'contour is not closed')
    c_cell{i} = scale.*bnd_tmp;
end

end