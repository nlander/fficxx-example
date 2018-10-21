#ifdef __cplusplus
extern "C" { 
#endif

#ifndef __MYSAMPLE__A__
#define __MYSAMPLE__A__

#include "MySampleType.h"
 // 

 // 
#undef A_DECL_VIRT 
#define A_DECL_VIRT(Type) \
void Type ## _method1 ( Type ## _p p )

#undef A_DECL_NONVIRT 
#define A_DECL_NONVIRT(Type) \
Type ## _p Type ## _newA (  )

#undef A_DECL_ACCESSOR
#define A_DECL_ACCESSOR(Type)\


#undef A_DEF_VIRT
#define A_DEF_VIRT(Type)\
void Type ## _method1 ( Type ## _p p )\
{\
to_nonconst<Type,Type ## _t>(p)->method1();\
}

#undef A_DEF_NONVIRT
#define A_DEF_NONVIRT(Type)\
Type ## _p Type ## _newA (  )\
{\
Type * newp = new Type (); \
return to_nonconst<Type ## _t, Type >(newp);\
}

#undef A_DEF_ACCESSOR
#define A_DEF_ACCESSOR(Type)\






A_DECL_VIRT(A);


A_DECL_NONVIRT(A);


A_DECL_ACCESSOR(A);


#endif // __MYSAMPLE__A__

#ifdef __cplusplus
}
#endif

