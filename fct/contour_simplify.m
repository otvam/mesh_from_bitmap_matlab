function c_cell_out = contour_simplify(c_cell_in, simplify_tol)
%CONTOUR_SIMPLIFY Simplify contour with a given angular tolerance.
%   c_cell_out = contour_simplify(c_cell_in, simplify_tol)
%   c_cell_in - cell array with the contours (cell)
%      c_cell_in{i}.pts - contour points (matrix)
%      c_cell_in{i}.is_cut - if the contour is a hole (boolean)
%   simplify_tol - angular tolerance for contour simplification (scalar)
%   c_cell_out - cell array with the simplified contours (cell of matrix)
%
%   See also CONTOUR_CREATE, REDUCEM.

%   Thomas Guillod.
%   2020 - BSD License.

% simplify all the contours
c_cell_out = {};
for i=1:length(c_cell_in)
    c_tmp = c_cell_in{i};
    [x_tmp, y_tmp] = reducem(c_tmp(:,1), c_tmp(:,2), simplify_tol);
    if (nnz(x_tmp)>0)&&(nnz(y_tmp)>0)
        c_cell_out{end+1} = [x_tmp, y_tmp];
    end
end

end
