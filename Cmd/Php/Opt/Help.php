<?
NameSpace Call\Opt;

Return New Class('Help','Help','Show this message without runing script') Extends TBase
{
  Function Process($Value)
  {
    Global $OptsInfo;
    $Options=[];
    ForEach($OptsInfo As $Name=>$Opt)
      $Options[]='  '.Str_Pad($Opt->Help_Key(), 14).' -- '.$Opt->Help_Value();
    //$Options[]='  '.Str_Pad($Opt[0], 15).' '.$Opt[1];
    $Options=Implode("\n", $Options);
    
    Echo <<<HereDoc
      Options:
      $Options
        #Any           -- Commented one option
        #: arg1 ...    -- Ignore all next options
      Example: <? //PHP8: Jit Mem:2G NewConsole- #Help Ignore Args: -d enable_dl=On
      Exec: CallPhp FineName Arg1 Arg2...ArgN
      HereDoc;
    Exit();
  }
};
