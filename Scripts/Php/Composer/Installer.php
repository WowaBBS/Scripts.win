<?
  if(php_sapi_name()!=='cli') return;

  $Dir               =__DIR__;
  $VendorDir         =$Dir.'\vendor';
  $Composer          =$VendorDir.'\composer.phar';
  $ComposerInstaller =$VendorDir.'\ComposerInstaller.php';
  
  if(!Is_Dir($VendorDir))
    @MkDir($VendorDir);
  
  if(!Is_File($Composer))
  {
    if(!Is_File($ComposerInstaller))
    {
      $Data=File_Get_Contents('https://getcomposer.org/installer');
      File_Put_Contents($ComposerInstaller, $Data);
    }

    if(!Is_File($ComposerInstaller))
      return;
    
    $_SERVER['argv']=$argv=[$ComposerInstaller, '--install-dir='.$VendorDir];
    include $ComposerInstaller;
  //UnLink($ComposerInstaller);
  }
?>