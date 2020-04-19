function save_primitives(output_filename,primitives)

file = fopen(output_filename, 'w');

fprintf(file, 'resolution_m: %f\n', primitives.resolution);
fprintf(file, 'numberofangles: %d\n', primitives.num_angles);
fprintf(file, 'totalnumberofprimitives: %d\n', ...
        primitives.num_prim*primitives.num_angles);

for primind = 1:primitives.num_angles*primitives.num_prim
    if(isempty(primitives.trajectories(primind).points)==0)
        fprintf(file, 'primID: %d\n', primitives.trajectories(primind).id);
        fprintf(file, 'startangle_c: %d\n', ...
            primitives.trajectories(primind).start_angle);
        fprintf(file, 'endpose_c: %d %d %d\n', ...
            primitives.trajectories(primind).endpose(1), ...
            primitives.trajectories(primind).endpose(2), ...
            primitives.trajectories(primind).endpose(3));
        fprintf(file, 'additionalactioncostmult: %d\n', ...
            primitives.trajectories(primind).cost);
        fprintf(file, 'intermediateposes: %d\n', ...
            primitives.num_samples);
        for interind = 1:primitives.num_samples
           fprintf(file, '%.4f %.4f %.4f\n', ...
               primitives.trajectories(primind).points(interind,1),...
               primitives.trajectories(primind).points(interind,2),...
               primitives.trajectories(primind).points(interind,3));
        end;
    end
end
fclose(file);