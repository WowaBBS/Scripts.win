<?
NameSpace Call\Opt;

Class TBase
{
  Var $Name       ='Undefined';
  Var $Help_Key   ='Undefined';
  Var $Help_Value ='Undefined';
  
  Function __Construct(
    $Name       ,
    $Help_Key   ,
    $Help_Value ,
  )
  {
    $this->Name       = $Name       ;
    $this->Help_Key   = $Help_Key   ;
    $this->Help_Value = $Help_Value ;
  }
  
  Function GetName    () { Return $this->Name       ; }
  Function Help_Key   () { Return $this->Help_Key   ; }
  Function Help_Value () { Return $this->Help_Value ; }
  Function Parse($Value) { Return $Value; }
  Function Process($Value) {}
}
