- Value: 8 byte
- TValue: 16 byte
- GCObject: 16 byte
- Node: 24 byte
- TString: 32 byte
- UpVal: 40 byte
- Table: 56 byte
- Proto (Function Prototypes): 128 byte
- lua_State: 200 byte

## 2.構造体の中身
#### 2-1.Value
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

#### 2-2.TValue
```
#define TValuefields	Value value_; lu_byte tt_

typedef struct TValue {
  TValuefields;
} TValue;

# 実中身
typedef struct TValue {
  // union
  struct GCObject *gc;    /* collectable objects */
  void *p;         /* light userdata */
  lua_CFunction f; /* light C functions */
  lua_Integer i;   /* integer numbers */
  lua_Number n;    /* float numbers */

  lu_byte tt_
}
```

### 2-3. GCObject
```
#define CommonHeader	struct GCObject *next; lu_byte tt; lu_byte marked

typedef struct GCObject {
  CommonHeader;
} GCObject;
```

### 2-4. Node
```
/*
** Nodes for Hash tables: A pack of two TValue's (key-value pairs)
** plus a 'next' field to link colliding entries. The distribution
** of the key's fields ('key_tt' and 'key_val') not forming a proper
** 'TValue' allows for a smaller size for 'Node' both in 4-byte
** and 8-byte alignments.
*/

#define TValuefields	Value value_; lu_byte tt_

typedef union Node {
  struct NodeKey {
    TValuefields;  /* fields for value */
    lu_byte key_tt;  /* key type */
    int next;  /* for chaining */
    Value key_val;  /* key value */
  } u;
  TValue i_val;  /* direct access to node's value as a proper 'TValue' */
} Node;
```


### 2- . Table
```
#define CommonHeader	struct GCObject *next; lu_byte tt; lu_byte marked

typedef struct Table {
  CommonHeader;
  lu_byte flags;  /* 1<<p means tagmethod(p) is not present */
  lu_byte lsizenode;  /* log2 of size of 'node' array */
  unsigned int alimit;  /* "limit" of 'array' array */
  TValue *array;  /* array part */
  Node *node;
  Node *lastfree;  /* any free position is before this position */
  struct Table *metatable;
  GCObject *gclist;
} Table;
```

## 3.basic type
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
