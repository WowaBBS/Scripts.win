<?
Function ParseFileInfo($CallFile)
{
  $Ext=PathInfo($CallFile, PATHINFO_EXTENSION);
  $Ver='';
  If(Str_Starts_With($Ext, $Prefix='php'))
    $Ver=SubStr($Ext, Strlen($Prefix));

  $f=FOpen($CallFile, 'r');
  If(!$f) { Print("Call File $CallFile not found\n"); Return [$Ver, '']; }
  
  $Line = FGetS($f);
  FClose($f);
  
//$f=New SplFileObject($FlieName, 'r');
//$Line=$f->FGetS();
//$f->Close();

  //TODO: Not only PHP but JS C++ etc
  $Line=Explode('<?', $Line, 2);
  If(!IsSet($Line[1])) Return [$Ver, ''];
  $Line=$Line[1];
  $Line=Explode('//CallPHP', $Line, 2);
  If(!IsSet($Line[1])) Return [$Ver, ''];
  $Line=$Line[1];
  If(!IsSet($Line[1])) Return [$Ver, ''];
  $Line=Explode(':', $Line, 2);
  $Ver=$Line[0];
  If(!IsSet($Line[1])) Return [$Ver, ''];
  $Line=Trim($Line[1]);
  $OptLine=Explode(' ', $Line);
  Return [$Ver, $OptLine];
}