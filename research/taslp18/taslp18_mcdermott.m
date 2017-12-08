% Script arguments:
% * audio_name_str

% Add McDermott toolbox.
addpath(genpath('~/Sound_Texture_Synthesis_Toolbox/'));

% Define parameters.
N = 131072;
synthesis_parameters_2011_Neuron_paper;
P.orig_sound_filename = [audio_name_str, '.wav'];
P.orig_sound_folder = 'media';
P.output_folder = 'media';
P.constraint_set.sub_kurt = 1;
P.compression_option=0;
P.audio_sr = 22050;
P.write_norm_orig = false;
P.display_figures = false;
P.save_figures = false;
P.max_orig_dur_s = 3;
P.desired_synth_dur_s = 3;


% Construct wavelet filter bank for visualization.
vis_archs = taslp18_setup_visualization(24, N);


run_synthesis(P);


% Load waveform.
audio_path = ['media/', audio_name_str, '.wav'];
[target_waveform, sample_rate] = taslp18_load(audio_path, N / 2);
