classdef globalsets
    properties (Constant)
        %% Cores per job
        NumberCores = 50;
        
        %% Parameters
        Years = 1985:2022;
        LandsatCollectionVersion = '02';

%         FolderpathMatlabCode = '/home/qiu25856/COLD_v2';

        %% Sets for CCD ###################
        %% Paths % where '%s' will be replaced by Landsat ARD tile's name
        FolderpathLandsat = '/gpfs/sharedfs1/zhulab/Shi/ProjectCONUSDisturbanceAgent/LandsatARDC2/%s'; % where '%s' will be replaced by Landsat ARD tile's name

        %% where '%s' will be replaced by Landsat ARD tile's name
        FolderpathCOLD = '/gpfs/sharedfs1/zhulab/Shi/ProjectCONUSDisturbanceAgent/Detection/%s';
        FolderpathDest = '/gpfs/sharedfs1/zhulab/Shi/ProjectCONUSDisturbanceAgent/Classification/%s';
        

        PathLandsatARD = '/lustre/scratch/qiu25856/DataLandsatARD/CONUS/';
        PathLandsatARDTOA = '/lustre/scratch/qiu25856/DataLandsatARD/CONUS_TOA/';
        PathCOLD = '/lustre/scratch/qiu25856/COLDResults/TestBRDF_DensityAdjust/';
        PathCOLDStackLine = '/lustre/scratch/qiu25856/COLDResults/TestBRDF_Denglobalsets.PathCOLDPackagesityAdjust_StackLine/';
        PathGeneralAccumuDistmap = '/lustre/scratch/qiu25856/COLDResults/CONUS_1path_AccumuDistMaps';
        PathGeneralAccumuChangeMagnitudeMap = '/lustre/scratch/qiu25856/CONUS_AccumulatedChangeMagnitudeMap';

        %% Working Folders
        FolderCode = 'Code';
        FolderLandsatImages = 'Collection2_Products';
        FolderStack = 'StackData';
        FolderTSFit = 'TSFitLine'; %'TSFitMap';
        FolderChangeMap = 'ChangeMap';
        FolderChangeMagnitudeMap = 'ChangeMagnitudeMap';
        FolderSyntheticImage = 'SyntheticImage';
        FolderModelCoeffImage = 'ModelCoefficentImage';

        %% Filenames
        FilenameDistMap = 'DisturbanceMap';
        FilenameDistCoeffs = 'ChangeCoeffs';
        FilenameDistMapAccumul = 'DisturbanceAccumuMap';
        FilenameRecordRemainRows = 'RecordRemainRows';

        %% Input File
        FilenameLandsatList = 'list_landsat.txt';

    end
end

