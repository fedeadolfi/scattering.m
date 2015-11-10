function invariant = setup_invariant(invariant)
if strcmp(invariant.spec.invariance, 'blurred')
    phi_ift = invariant.spec.handle(invariant.spec);
    dimension = get_handle_dimension(invariant.spec.handle);
    phi_ft = multidimensional_fft(phi_ift,1:dimension);
    if invariant.spec.has_real_ft
        phi_ft = real(phi_ft);
    end
    invariant.phi = optimize_bank(phi_ft,phi_ift,invariant);
end
end

