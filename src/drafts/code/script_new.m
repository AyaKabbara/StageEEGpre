% Script generated by Brainstorm (07-Sep-2021)

% Input files
sFiles = {...
    'Subject01/@rawtutorial_eeg/data_0raw_tutorial_eeg.mat'};

% Start a new report
bst_report('Start', sFiles);

% Process: Refine registration
sFiles = bst_process('CallProcess', 'process_headpoints_refine', sFiles, []);

% Process: Project electrodes on scalp
sFiles = bst_process('CallProcess', 'process_channel_project', sFiles, [], ...
    'sensortypes', 'EEG');

% Save and display report
ReportFile = bst_report('Save', sFiles);
bst_report('Open', ReportFile);
% bst_report('Export', ReportFile, ExportDir);

