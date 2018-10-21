#ifdef __cplusplus
extern "C" { 
#endif

#ifndef __MYSAMPLE__B__
#define __MYSAMPLE__B__

#include "MySampleType.h"
 // 
#include "MySampleA.h"
 // 
#undef B_DECL_VIRT 
#define B_DECL_VIRT(Type) \
A_p Type ## _method2 ( Type ## _p p, A_p x )

#undef B_DECL_NONVIRT 
#define B_DECL_NONVIRT(Type) \
Type ## _p Type ## _newB (  )

#undef B_DECL_ACCESSOR
#define B_DECL_ACCESSOR(Type)\


#undef B_DEF_VIRT
#define B_DEF_VIRT(Type)\
A_p Type ## _method2 ( Type ## _p p, A_p x )\
{\
return to_nonconst<A_t,A>((A*)to_nonconst<Type,Type ## _t>(p)->method2(to_nonconst<A,A_t>(x)));\
}

#undef B_DEF_NONVIRT
#define B_DEF_NONVIRT(Type)\
Type ## _p Type ## _newB (  )\
{\
Type * newp = new Type (); \
return to_nonconst<Type ## _t, Type >(newp);\
}

#undef B_DEF_ACCESSOR
#define B_DEF_ACCESSOR(Type)\




A_DECL_VIRT(B);


B_DECL_VIRT(B);


B_DECL_NONVIRT(B);


B_DECL_ACCESSOR(B);


#endif // __MYSAMPLE__B__

#ifdef __cplusplus
}
#endif

