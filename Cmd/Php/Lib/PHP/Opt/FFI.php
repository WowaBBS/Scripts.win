<?
NameSpace Call\Opt;

Return New Class('FFI', 'FFI[|-|:Str]', 'Enable/Disable FFI') Extends TBase
{
  Function Process($Value)
  {
    If($Value===Null) Return;
    If($Value===True) $Value='1255'; //5141
    Global $PhpConfig;

    $Cfg=&$PhpConfig['ffi'];
    $Cfg['enable']=$Value!==False? 1:0;
  }

  Function GetDefault() { Return True; }
};
