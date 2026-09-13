<?

$Options=[];
$OptLine=[];
$OptsInfo=NormalizeOptsInfo(Include 'Opt/All.php');

Function NormalizeOptsInfo($OptsInfo)
{
  $Res=[];
  ForEach($OptsInfo As $OptInfo)
    //TODO: Check duplicates
    $Res[$OptInfo->GetName()]=$OptInfo;
  Return $Res;
}

Function ParseOpts($Line)
{
  Global $OptsInfo;
  Global $OptLine;
  Global $Options;
  
  $OptLine=$Line;
  
  $Opts=[];
  While($OptLine)
  {
    $FullOpt=Array_Shift($OptLine);
    If($FullOpt==='') Return $Options;
    If(StrLen($FullOpt) && $FullOpt[0]==='#') // Comment
    {
      If($FullOpt==='#:') Break;
      Continue;
    }
    
    $Item=Explode(':', $FullOpt, 2);
    $Name  =$Item[0];
    $Value =$Item[1]?? Null;
    $Op='';
    If($Value!==Null)
      $Op=':';
    ElseIf($Name!=='')
    {
      Static $OpMap=['-'=>False, '+'=>True];
      $Op=$Name[StrLen($Name)-1];
      If(Array_Key_Exists($Op, $OpMap))
      {
        $Value=$OpMap[$Op];
        $Name=SubStr($Name, 0, -1);
      }
      Else
        $Value=True;
    }
    
    $OptInfo=$OptsInfo[$Name]?? Null;
    If($OptInfo===Null)
      Echo 'Unknown option ', $Name, ':', $Value, "\n";
    Else
      $Options[$Name]=$OptInfo->Parse($Value); //$Name, $Op
  }
  Return $Options;
}

Function DefaulOpts($Options)
{
  Global $OptsInfo;
  ForEach($OptsInfo As $OptInfo)
    If(!Is_Null($Value=$OptInfo->GetDefault()))
      $Options[$OptInfo->GetName()]??=$Value;
  Return $Options;
}

Function ProcessOpts($Options)
{
  Global $OptsInfo;
  ForEach($Options As $Name=>$Value)
    If($OptInfo=$OptsInfo[$Name]?? Null)
      $OptInfo->Process($Value);
    Else
      Echo 'Unknown option ', $Name, ':', $Value, "\n";
}

Function ShowOpts($Options)
{
  Global $OptsInfo;
  $Res=[];
  ForEach($Options As $Name=>$Value)
    If($OptInfo=$OptsInfo[$Name]?? Null)
    {
      $R=$OptInfo->Show($Value);
      If($R!=='')
        $Res[]=$R;
    }
  Return Implode(' ', $Res);
}