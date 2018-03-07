unit UClass;

interface

uses
  UInterface;

type
  TMyClass = class (TObject, MyInterface)
  private
    Fused: integer;
  public
    myAttr: integer;
    constructor Create(const attr: integer);
    destructor  Destroy; override;

    // MyInterface
    function getMyAttr: integer;

    // IInterface
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

implementation

{ TMyClass }

constructor TMyClass.Create(const attr: integer);
begin
  inherited Create;
  myAttr := attr;
  Fused := 0;
end;

destructor TMyClass.Destroy;
begin
  //
  inherited;
end;

function TMyClass.getMyAttr: integer;
begin
  result := myAttr;
end;

function TMyClass.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  result := s_ok;
end;

function TMyClass._AddRef: Integer;
begin
  inc(FUsed);
  result := FUsed;
end;

function TMyClass._Release: Integer;
begin
  dec(FUsed);
  result := FUsed;
  if result = 0 then
    free;
end;

end.
