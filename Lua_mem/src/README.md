### size
- Value: 8 byte
- TValue: 16 byte
- GCObject: 16 byte
- Node: 24 byte
- TString: 32 byte
- UpVal: 40 byte
- Table: 56 byte
- Proto (Function Prototypes): 128 byte
- lua_State: 200 byte

### 構造
#### Value
```
typedef union Value {
  struct GCObject *gc;    /* collectable objects */
  void *p;         /* light userdata */
  lua_CFunction f; /* light C functions */
  lua_Integer i;   /* integer numbers */
  lua_Number n;    /* float numbers */
} Value;

```

lua number, lua integerなどがただのdoubleの可能性がある
たまにでてくるc_functionが
lu_byte(おそらく型情報)がGCObjectの方でも持っている

TValue,その中身のGCObjectの関係をしっかり図示するといい

#### TValue
```
#define TValuefields	Value value_; lu_byte tt_

typedef struct TValue {
  TValuefields;
} TValue;
```

#### GCObject


### basic type
```
#define LUA_TNONE		(-1)

#define LUA_TNIL		0
#define LUA_TBOOLEAN		1
#define LUA_TLIGHTUSERDATA	2
#define LUA_TNUMBER		3
#define LUA_TSTRING		4
#define LUA_TTABLE		5
#define LUA_TFUNCTION		6
#define LUA_TUSERDATA		7
#define LUA_TTHREAD		8

#define LUA_NUMTYPES		9
```
