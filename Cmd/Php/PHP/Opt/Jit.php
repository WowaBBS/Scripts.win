<?
NameSpace Call\Opt;

Return New Class('Jit', 'Jit[|-|:Str]', 'Enable/Disable: Jit, Jit-, Jit:1255') Extends TBase
{
  Function Process($Value)
  {
    If($Value===Null) Return;
    If($Value===True) $Value='1255'; //5141
    Global $PhpConfig;

    $Cfg=&$PhpConfig['opcache'];
    $Cfg['enable_cli']=$Value!==False? 1:0;
    If(Is_String($Value))
    {
      $Cfg['jit_buffer_size' ]??='100M'; // Todo Custom
      $Cfg['jit'             ]  =$Value;
    }
  }

//Function GetDefault() { Return False; }
//Function GetDefault() { Return True; }
};
