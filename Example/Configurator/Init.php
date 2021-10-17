<?
  echo 'Php configurator', "\n";
  
  include GetEnv('Scripts_Path').'Php/Lib/LoadGit.php';
  
  $OutDir=GetEnv('Php_Distrib');

  $GitList=[
    'List'=>[
      'WLib'=>[
        'User'    =>'WowaBBS',
        'Project' =>'WLib.php',
        'Rev'     =>'1f9131055f4b053e2ac564fd8334f0a1fbc0f48a',
        'Md5'     =>'6dee4e99471337d71e3010dc96bee432',
        'OutDir'  =>$OutDir,
      ],
    ],
  ];
  $GitPaths=LoadGitList($GitList);

  Include($GitPaths['WLib'].'Src/WLib/Using.php');

  $Config=[
    'set WLib_Path'      .'='.RealPath($GitPaths['WLib'       ]).'/',
  ];
  $ConfigDir=__DIR__.'/../.Config';
  if(!Is_Dir($ConfigDir))
    MkDir($ConfigDir);
  File_Put_Contents($ConfigDir.'/Config_Php.bat', Implode("\n", $Config));
  $Config=[ // TODO: Relative paths __DIR__.'/../../
    'WLib'      =>StrTr(RealPath($GitPaths['WLib'       ]).'/', '\\', '/'),
  ];
  File_Put_Contents($ConfigDir.'/Config.php', "<?\n \$Config=".Var_Export($Config, True).";\n?".'>');
?>