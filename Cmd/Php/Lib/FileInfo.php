<?
Function ParseFileInfo($SourceFile)
{
  [$Ver, $Shebang, $Line]=ReadFileInfo($SourceFile);

  //TODO: Not only PHP but JS C++ etc
  $Line=Explode('<?', $Line, 2);
  If(!IsSet($Line[1])) Return [$Ver, ''];
  $Line=$Line[1];
  $Line=Explode('//CallPHP', $Line, 2);
  If(!IsSet($Line[1])) 
    $Line=Explode('//PHP', $Line[0], 2);
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

Function ReadFileInfo($SourceFile)
{
  $Ext=PathInfo($SourceFile, PATHINFO_EXTENSION);
  $Ver='';
  $Shebang='';
  If(Str_Starts_With($Ext, $Prefix='php'))
    $Ver=SubStr($Ext, Strlen($Prefix));

  $f=FOpen($SourceFile, 'r');
  If(!$f) { Print("Source File $SourceFile not found\n"); Return [$Ver, '']; }
  
  $FirstLine = FGetS($f);
  If(Str_Starts_With($FirstLine, '#!'))
  {
    $Shebang=$FirstLine;
    $FirstLine=FGetS($f);
  }
  FClose($f);
  
//$f=New SplFileObject($FlieName, 'r');
//$FirstLine=$f->FGetS();
//$f->Close();
  Return [$Ver, $Shebang, $FirstLine];
}