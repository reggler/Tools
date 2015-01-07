" Vim syntax file
" Language:		C++ STL
" Maintainer:	brobeson (http://github.com/brobeson/Tools)
" Last Change:	17 December 2014

" use this variable to control whether object methods should be
" highlighted.
let stl_highlight_methods = 1
let cpp_no_cpp11 = 1
let cpp_no_cpp17 = 1

syntax keyword stlNamespace std

" TODO utilities {{{
"		" type support {{{
"		" TODO	verify this
"		syntax match   stlTypedef "std::\(max_align\|nullptr\|ptrdiff\|size\)_t"
"		syntax keyword stlMacro   __alignas_is_defined __bool_true_false_are_defined offsetof
"
"		" fixed width integer types
"		" most of these are already in the cpp.vim
"		syntax keyword stlMacro INT8_C INT16_C INT32_C INT64_C INTMAX_C UINT8_C UINT16_C UINT32_C UINT64_C UINTMAX_C
"
"		" numeric limits
"		" most of the C macros are already in cpp.vim
"		syntax match   stlTemplate "std::numeric_limits"
"		syntax match   stlConstant "std::numeric_limits::has_\(infinity\|quiet_NaN\|signaling_NaN\|denorm\|denorm_loss\)"
"		syntax match   stlConstant "std::numeric_limits::is_\(specialized\|signed\|integer\|exact\|iec559\|bounded\|modulo\)"
"		syntax match   stlConstant "std::numeric_limits::\(digits\(10\)\?\|max_digits10\|max_exponent\(10\)\?\|min_exponent\(10\)\?\)"
"		syntax match   stlConstant "std::numeric_limits::\(radix\|round_style\|tinyness_before\|traps\)"
"		syntax match   stlFunction "std::numeric_limits::\(denorm_min\|epsilon\|infinity\|lowest\|max\|min\|quet_NaN\|round_error\|signaling_NaN\)"
"		syntax keyword stlMacro    DECIMAL_DIG FLT_EVAL_METHOD
"
"		" runtime type identification
"		" std::bad_typeid and bad_cast are documented with the other exceptions
"		syntax match stlClass "std::type_\(index\|info\)"
"		if exists("stl_highlight_methods")
"			syntax match stlMethod "\.\(before\|hash_code\|name\)"ms=s+1
"		endif
"
"		" type traits
"		syntax match stlTemplate "std::is_\(abstract\|arithmetic\|array\|base_of\|class\|compound\|const\|convertible\)"
"		syntax match stlTemplate "std::is_\(empty\|enum\|final\|floating_point\|function\|fundamental\|integral\)"
"		syntax match stlTemplate "std::is_\(literal_type\|lvalue_reference\|member_function_pointer\|member_object_pointer\)"
"		syntax match stlTemplate "std::is_\(member_pointer\|null_pointer\|object\|pod\|pointer\|polymorphic\|reference\)"
"		syntax match stlTemplate "std::is_\(rvalue_reference\|same\|scalar\|signed\|standard_layout\|trivial\)"
"		syntax match stlTemplate "std::is_\(trivially_copyable\|union\|unsigned\|void\|volatile\)"
"		syntax match stlTemplate "std::is_\(nothrow_\|trivially_\)\?\(copy_\|default_\|move_\)\?\(constructible\|assignable\)"
"		syntax match stlTemplate "std::is_\(nothrow_\|trivially_\)\?destructible"
"		syntax match stlTemplate "std::\(alignment_of\|extent\|has_virtual_destructor\|rank\)"
"		syntax match stlMember   "std::is_\(abstract\|arithmetic\|array\|base_of\|class\|compound\|const\|convertible\)::value"
"		syntax match stlMember   "std::is_\(empty\|enum\|final\|floating_point\|function\|fundamental\|integral\)::value"
"		syntax match stlMember   "std::is_\(literal_type\|lvalue_reference\|member_function_pointer\|member_object_pointer\)::value"
"		syntax match stlMember   "std::is_\(member_pointer\|null_pointer\|object\|pod\|pointer\|polymorphic\|reference\)::value"
"		syntax match stlMember   "std::is_\(rvalue_reference\|same\|scalar\|signed\|standard_layout\|trivial\)::value"
"		syntax match stlMember   "std::is_\(trivially_copyable\|union\|unsigned\|void\|volatile\)::value"
"		syntax match stlMember   "std::is_\(nothrow_\|trivially_\)\?\(copy_\|default_\|move_\)\?\(constructible\|assignable\)::value"
"		syntax match stlMember   "std::is_\(nothrow_\|trivially_\)\?destructible::value"
"		syntax match stlMember   "std::\(alignment_of\|extent\|has_virtual_destructor\|rank\)::value"
"
"		" type modifications
"		syntax match stlTemplate "std::\(add\|remove\)_\(const\|cv\|pointer\|volatile\)"
"		syntax match stlTemplate "std::\(add_[rl]value\|remove\)_reference"
"		syntax match stlTemplate "std::remove_\(all_\)\?extent"
"		syntax match stlTemplate "make_\(un\)\?signed"
"		syntax match stlMember   "std::\(add\|remove\)_\(const\|cv\|pointer\|volatile\)::value"
"		syntax match stlMember   "std::\(add_[rl]value\|remove\)_reference::value"
"		syntax match stlMember   "std::remove_\(all_\)\?extent::value"
"		syntax match stlMember   "make_\(un\)\?signed::value"
"
"		" miscellaneous transformations
"		syntax match stlTemplate "std::\(aligned_storage\|aligned_union\|common_type\|conditional\|decay\|enable_if\|result_of\|underlying_type\)"
"		syntax match stlMember   "std::\(aligned_storage\|aligned_union\|common_type\|conditional\|decay\|enable_if\|result_of\|underlying_type\)::type"
"		syntax match stlConstant "std::aligned_union::alignment_value"
"
"		" helper classes
"		syntax match stlTemplate "std::integral_constant"
"		syntax match stlConstant "std::integral_constant::value"
"		" }}}
"
"		" dynamic memory management {{{
"		" TODO	verify this
"		" smart pointers
"		syntax match stlTemplate "std::\(unique\|shared\|weak\|auto\)_ptr"
"		syntax match stlTemplate "std::\(owner_less\|enable_shared_from_this\|default_delete\)"
"		syntax match stlFunction "std::\(allocate_shared\|const_pointer_cast\|dynamic_pointer_cast\|get_deleter\)"
"		syntax match stlFunction "std::\(make_shared\|make_unique\|static_pointer_cast\)"
"		if exists("stl_highlight_methods")
"			syntax match stlMethod "\.\(expired\|get_deleter\|lock\|owner_before\|release\|reset\|shared_from_this\|unique\|use_count\)"
"		endif
"
"		" allocators
"		syntax match stlTemplate "std::\(allocator\|allocator_traits\|uses_allocator\|scoped_allocator_adaptor\)"
"		syntax match stlClass    "std::allocator_arg_t"
"		syntax match stlConstant "std::allocator_arg"
"		syntax match stlFunction "std::allocator_traits::\(allocate\|construct\|deallocate\|destroy\|max_size\|select_on_container_copy_construction\)"
"		syntax match stlConstant "std::uses_allocator::value"
"		if exists("stl_highlight_methods")
"			syntax match stlMethod "\.\(address\|allocate\|construct\|deallocate\|destroy\|inner_allocator\|max_size\|outer_allocator\|select-on_contain_copy_construction\)"
"		endif
"		
"		" uninitialized storage
"		syntax match stlTemplate "std::raw_storage_iterator"
"		syntax match stlFunction "std::\(uninitialized_\(copy\|copy_n\|fill\|fill_n\)\)"
"		syntax match stlFunction "std::\(get_temporary_buffer\|return_temporary_buffer\)"
"
"		" garbage collector support
"		syntax match stlEnumeration "std::pointer_safety"
"		syntax match stlEnumValue   "std::pointer_safety::\(preferred\|relaxed\|strict\)"
"		syntax match stlFunction    "std::\(un\)\?declare_\(reachable\|no_pointers\)"
"		syntax match stlFunction    "std::get_pointer_safety"
"
"		" miscellaneous
"		syntax match stlTemplate "std::pointer_traits"
"		syntax match stlFunction "std::pointer_traits::pointer_to"
"		syntax match stlFunction "std::\(addressof\|align\)"
"
"		" C-style memory management
"		syntax match stlFunction "std::\(calloc\|free\|malloc\|realloc\)"
"
"		" low level memory management
"		syntax match stlFunction "std::[gs]et_new_handler"
"		syntax match stlConstant "std::nothrow"
"		syntax match stlClass    "std::nothrow_t"
"		syntax match stlTypedef  "std::new_handler"
"		" }}}
"	" }}}

" TODO string objects and character arrays {{{
"	" TODO verify this
"	syntax match stlTemplate "std::\(char_traits\|\(basic_\|u16\|u32\|w\)\?string\)"
"	syntax match stlConstant "std::string::npos"
"	syntax match stlFunction "std::\(getline\|sto\(d\|f\|i\|l\|ld\|ll\|ul\|ull\)\|swap\|to_w\?string\)"
"	if exists("stl_highlight_methods")
"		syntax match stlMethod "\.\(append\|assign\|at\|back\|begin\|c_str\|capacity\|cbegin\|cend\)"ms=s+1
"		syntax match stlMethod "\.\(clear\|compare\|copy\|crbegin\|crend\|empty\|end\|data\|erase\)"ms=s+1
"		syntax match stlMethod "\.\(find\|find_first_not_of\|find_first_of\|find_last_not_of\)"ms=s+1
"		syntax match stlMethod "\.\(find_last_of\|front\|get_allocator\|insert\|length\|max_size\)"ms=s+1
"		syntax match stlMethod "\.\(pop_back\|push_back\|rbegin\|rend\|replace\|reserve\|resize\)"ms=s+1
"		syntax match stlMethod "\.\(rfind\|shrink_to_fit\|size\|substr\|swap\)"ms=s+1
"	endif
"
"	" null terminated byte strings
"	syntax match stlFunction "std::is\(alnum\|alpha\|lower\|upper\|digit\|xdigit\|cntrl\|graph\|space\|blank\|print\|punct\)"
"	syntax match stlFunction "std::to\(lower\|upper\)"
"	syntax match stlFunction "std::ato\(f\|i\|l\|ll\)"
"	syntax match stlFunction "std::strto\(l\|ll\|ul\|ull\|f\|d\|ld\|imax\|umax\)"
"	syntax match stlFunction "std::str\(cpy\|ncpy\|cat\|ncat\|xfrm\|len\|cmp\|ncmp\|coll\|chr\|rchr\|spn\|cspn\|pbrk\|str\|tok\|error\)"
"	syntax match stlFunction "std::mem\(chr\|cmp\|set\|cpy\|move\)"
"
"	" null terminated multibyte strings
"	syntax match   stlFunction "std::mb\(len\|towc\|stowcs\|sinit\|rlen\|rtowc\|srtowcs\|rtoc16\|rtoc32\)"
"	syntax match   stlFunction "std::wc\(tomb\|stombs\|tob\|rtomb\|srtombs\)"
"	syntax match   stlFunction "std::\(btowc\|c16rtomb\|c32rtomb\)"
"	syntax match   stlStruct   "std::mbstate_t"
"	syntax keyword stlMacro    MB_CUR_MAX __STDC_UTF_16__ __STDC_UTF_32__
"
"	" null terminated wide strings
"	syntax match   stlFunction "std::isw\(alnum\|alpha\|lower\|upper\|digit\|xdigit\|cntrl\|graph\|space\|blank\|print\|punct\|ctype\)"
"	syntax match   stlFunction "std::wc\(type\|trans\)"
"	syntax match   stlFunction "std::tow\(lower\|upper\|ctrans\)"
"	syntax match   stlFunction "std::wcsto\(l\|ll\|ul\|ull\|f\|d\|ld\|imax\|umax\)"
"	syntax match   stlFunction "std::wcs\(cpy\|ncpy\|cat\|ncat\|xfrm\|len\|cmp\|ncmp\|coll\|chr\|rchr\|spn\|cspn\|pbrk\|str\|tok\)"
"	syntax match   stlFunction "std::wmem\(chr\|cmp\|set\|cpy\|move\)"
"	syntax match   stlStruct   "std::\(wctrans_t\|wctype_t\|wint_t\)"
"	syntax keyword stlMacro    WEOF
"	" }}}

" WORKING ON containers {{{
	" TODO from stl11: array forward_list unordered_map unordered_multimap unordered_multiset unordered_set
	" TODO TEST 
	syntax keyword stlContainerId	deque list map multimap multiset priority_queue queue set stack vector
	syntax keyword stlTypeId		allocator_type const_iterator const_pointer const_reference
	syntax keyword stlTypeId		const_reverse_iterator container_type difference_type first_argument_type iterator
	syntax keyword stlTypeId		key_compare key_type mapped_type pointer reference result_type reverse_iterator
	syntax keyword stlTypeId		second_argument_type size_type value_type
	syntax keyword stlMemberClassId value_compare
	syntax keyword stlMethodId		assign at back begin capacity cbegin cend clear count crbegin crend
	syntax keyword stlMethodId		empty end equal_range erase find front get_allocator insert key_comp
	syntax keyword stlMethodId		lower_bound max_size merge pop pop_back pop_front push push_back
	syntax keyword stlMethodId		push_front rbegin remove remove_if rend reserve resize reverse size
	syntax keyword stlMethodId		sort splice swap top unique upper_bound value_comp
	syntax keyword stl11MethodId	data emplace emplace_back emplace_front emplace_hint shrink_to_fit
	syntax keyword stl17MethodId	insert_or_assign try_emplace
	syntax keyword stlFunctionId	swap
	syntax keyword stlMemberId		c comp

	" helper classes
	"	std::uses_allocator

	"syntax match stlContainer	/stl::\(deque\|list\|map\|multimap\|multiset\|priority_queue\|queue\|set\|stack\|vector\)/ contains=stdContainerId
	"syntax match stlClass     "stl::\(multi\)\?map::value_compare"
	"syntax match stlFunction  "std::get"
	"if exists("stl_highlight_methods")
	"	syntax match stlMethod "\.\(before_begin\|bucket\|bucket_count\|bucket_size\|cbefore_begin\|count\|emplace\)"ms=s+1
	"	syntax match stlMethod "\.\(emplace_after\|emplace_back\|emplace_front\|emplace_hint\|equal_range\|erase_after\)"ms=s+1
	"	syntax match stlMethod "\.\(fill\|hash_function\|insert_after\|insert_or_assign\|key_comp\|key_eq\|load_factor\)"ms=s+1
	"	syntax match stlMethod "\.\(lower_bound\|max_bucket_count\|max_load_factor\|merge\|pop\|pop_front\|push\)"ms=s+1
	"	syntax match stlMethod "\.\(push_front\|rehash\|remove\|remove_if\|reverse\|sort\|splice\|splice_after\|top\)"ms=s+1
	"	syntax match stlMethod "\.\(try_emplace\|unique\|upper_bound\|value_comp\)"ms=s+1
	"endif
" }}}

" TODO algorithms {{{
" }}}

" TODO iterators {{{
" }}}

" TODO numerics {{{
" }}}

" TODO input/output {{{
" }}}

" TODO localizations {{{
" }}}

" TODO regular expressions {{{
" }}}

" TODO atomic operations {{{
" }}}

" TODO thread support {{{
" }}}

" TODO C++11 {{{
	" containers {{{
		"forward_list
		"unordered_set
		"unordered_multiset
		"unordered_map
		"unordered_multimap
		"syntax keyword stl11ContainerId array
		"syntax keyword stl11FunctionId  get swap
		"syntax keyword stl11MethodId    at back begin cbegin cend crbegin crend data empty end fill front max_size
		"syntax keyword stl11MethodId    rbegin rend size swap
		"syntax keyword stl11TypeId      const_iterator const_pointer const_reference const_reverse_iterator
		"syntax keyword stl11TypeId      difference_type iterator pointer reference reverse_iterator size_type value_type
		"syntax match   stlFunction      "\<std::\(get\|swap\)\s*("me=e-1 contains=stlNamespace,stl11FunctionId
		"syntax match   stlMethod        "\.\(at\|back\|begin\|cbegin\|cend\|crbegin\|crend\|data\|empty\|end\|fill\|front\|max_size\|rbegin\|rend\|size\|swap\)\s*("ms=s+1,me=e-1 contains=stl11MethodId
		"syntax match   stlTemplate      "\<std::array\>" contains=stlNamespace,stl11ContainerId
		"syntax match   stlTypedef       "\<std::array::\(const_iterator\|const_pointer\|const_reference\|const_reverse_iterator\|difference_type\|iterator\|pointer\|reference\|reverse_iterator\|size_type\|value_type\)\>" contains=stlNamespace,stl11ContainerId,stl11TypeId
		"syntax match   stl11Function "std::\(get\|swap\)"
	" }}}
" }}}

"highlight default link stlConstant      Constant
 highlight default link stlContainerId   Structure
"highlight default link stlEnumeration   Type
"highlight default link stlEnumValue     Constant
"highlight default link stlError         Error
 highlight default link stlFunctionId    Function
"highlight default link stlMacro         Macro
 highlight default link stlMemberId      Identifier
 highlight default link stlMemberClassId Structure
 highlight default link stlNamespace     Structure
"highlight default link stlStruct        Structure
"highlight default link stlTemplate      Structure
 highlight default link stlTypeId        Typedef

" highlighting of methods
if exists("stl_highlight_methods")
	highlight default link stlMethodId Function
	if exists("cpp_no_cpp11")
		highlight default link stl11MethodId Error
	else
		highlight default link stl11MethodId stlMethodId
	endif
	if exists("cpp_no_cpp17")
		highlight default link stl17MethodId Error
	else
		highlight default link stl17MethodId stlMethodId
	endif
endif

" highlighting of C++11 STL changes
"if exists("cpp_no_cpp11")
"	highlight default link stl11ContainerId Error
"	highlight default link stl11FunctionId  Error
"	"highlight default link stl11Template Error
"	highlight default link stl11TypeId      Error
"else
"	highlight default link stl11ContainerId stlContainerId
"	highlight default link stl11FunctionId  stlFunctionId
"	"highlight default link stl11Template stlTemplate
"	highlight default link stl11TypeId      stlTypeId
"endif


