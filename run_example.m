function run_example()
%RUN_EXAMPLE Generate a 2d FEM PDE  mesh from a black and white image.
%
%   See also GET_MESH.

%   Thomas Guillod.
%   2020 - BSD License.

close('all')
addpath('fct')

%% data_img
img_data = struct(...
    'img', imread('model.bmp'),...
    'scale', 0.1,...
    'simplify_tol', 0.1,...
    'h_growth', 1.3,...
    'h_min', 2.0,...
    'h_max', 20.0...
    );

%% run
mesh = get_mesh(img_data);

%% plot
figure()
pdemesh(mesh)
axis('tight')
axis('off')

end