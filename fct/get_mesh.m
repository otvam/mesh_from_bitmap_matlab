function mesh = get_mesh(img_data)
%GET_MESH Transform a 2d image a 2d FEM PDE mesh.
%   fv = GET_MESH(img_data, merge_data)
%   img_data - information for transformer the images to plates (struct)
%      img_data.img - color image with the contour information (matrix)
%      img_data.scale - size per pixel of the image (scalar)
%      img_data.simplify_tol - angular tolerance for contour simplification (scalar)
%      img_data.h_growth - growth rate of the mesh (scalar)
%      img_data.h_min - minimal mesh element (scalar)
%      img_data.h_max - maximal mesh element (scalar)
%   mesh - a PDE FEMesh object with the mesh (object)
%
%   1. Transform the images into contours and into plates.
%   2. Select, permute, and shift the plates.
%   3. Assemble and merge the plates.
%
%   See also COUTOUR_CREATE, CONTOUR_SIMPLIFY, TRIANGULATION_CREATE.

%   Thomas Guillod.
%   2020 - BSD License.

% extract
img = img_data.img;
scale = img_data.scale;
simplify_tol = img_data.simplify_tol;
h_growth = img_data.h_growth;
h_min = img_data.h_min;
h_max = img_data.h_max;

% transform the image into binary
img = rgb2gray(img);
img = imbinarize(img);
img = img==false;

% rotate coordinate
img = fliplr(img.');

% get the contours of the image
c_cell = contour_create(img, scale);
c_cell = contour_simplify(c_cell, simplify_tol);

% create the 2d triangulation
mesh = triangulation_create(c_cell, h_growth, h_min, h_max);

% disp
fprintf('data\n');
fprintf('    img = %d x %d\n', size(img,1), size(img,2));
fprintf('    contour = %d\n', length(c_cell));
fprintf('    nodes = %d\n', size(mesh.Nodes, 2));
fprintf('    elements = %d\n', size(mesh.Elements, 2));
fprintf('    max_element_size = %d\n', mesh.MaxElementSize);
fprintf('    min_element_size = %d\n', mesh.MinElementSize);
fprintf('    mesh_gradation = %d\n', mesh.MeshGradation);
fprintf('    geometric_order = %s\n', mesh.GeometricOrder);

end