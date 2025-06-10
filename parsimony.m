% script to move all parcels into the fsaverage template space


%% directory for all existing parcels, in different template spaces
srcParcelDir = '../parcels/';
% in cvs_avg35
dJP = dir([srcParcelDir 'all/*.nii.gz']);
% in cvs_avg35_inMNI152
dLang = dir([srcParcelDir 'EvLab_lang_parcels/langparcel*.nii']);
% in ??
dSpeech = dir([srcParcelDir 'speech_parcels/*.nii']);
% in ??
dToM = dir([srcParcelDir 'ToM_parcels/*.nii.gz']);
% in ??
dPhys = dir([srcParcelDir 'physics/*.nii.gz']);
% in cvs_avg35_inMNI152
dVWFA = dir([srcParcelDir 'lvwfa.nii.gz']);
% in ??
dMD = dir([srcParcelDir 'md/*.nii.gz']);


%% command for moving cvs_avg35 --> cvs_avg35_inMNI152
srcParcel = '';
outParcel = '';

cmd = ['mri_vol2vol' ...
        ' --mov $FREESURFER_HOME/subjects/cvs_avg35/mri/orig.mgz' ...
        ' --targ $FREESURFER_HOME/subjects/cvs_avg35_inMNI152/mri/orig.mgz' ...
        ' --regheader' ...
        ' --interp nearest' ...
        ' --o ' outParcel  ...
        ' --movparcel ' srcParcel
        ];
unix(cmd)
