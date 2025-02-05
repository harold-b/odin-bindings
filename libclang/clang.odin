package clang

import "base:intrinsics"
import "base:runtime"
import cffi "core:c"

when ODIN_OS == .Linux {
    @require foreign import lib_clang {
        "lib/linux/libclang.so",
    }
}
when ODIN_OS == .Windows {
    @require foreign import lib_clang {
        "lib/windows/libclang.dll",
    }
}
when ODIN_OS == .Darwin {
    @require foreign import lib_clang {
        "lib/macos/libclang.dylib",
    }
}



@(default_calling_convention="c")
foreign lib_clang {
    @(require_results)
    @(link_name="clang_getCString")
    getCString :: proc(string: String) -> cstring ---

    @(link_name="clang_disposeString")
    disposeString :: proc(string: String) ---

    @(link_name="clang_disposeStringSet")
    disposeStringSet :: proc(set: ^StringSet) ---

    @(link_name="clang_getBuildSessionTimestamp")
    getBuildSessionTimestamp :: proc() -> cffi.ulonglong ---

    @(require_results)
    @(link_name="clang_VirtualFileOverlay_create")
    VirtualFileOverlay_create :: proc(options: cffi.uint) -> VirtualFileOverlay ---

    @(link_name="clang_VirtualFileOverlay_addFileMapping")
    VirtualFileOverlay_addFileMapping :: proc(_0: VirtualFileOverlay, virtualPath: cstring, realPath: cstring) -> ErrorCode ---

    @(link_name="clang_VirtualFileOverlay_setCaseSensitivity")
    VirtualFileOverlay_setCaseSensitivity :: proc(_0: VirtualFileOverlay, caseSensitive: cffi.int) -> ErrorCode ---

    @(link_name="clang_VirtualFileOverlay_writeToBuffer")
    VirtualFileOverlay_writeToBuffer :: proc(_0: VirtualFileOverlay, options: cffi.uint, out_buffer_ptr: ^cstring, out_buffer_size: ^cffi.uint) -> ErrorCode ---

    @(link_name="clang_free")
    free :: proc(buffer: rawptr) ---

    @(link_name="clang_VirtualFileOverlay_dispose")
    VirtualFileOverlay_dispose :: proc(_0: VirtualFileOverlay) ---

    @(require_results)
    @(link_name="clang_ModuleMapDescriptor_create")
    ModuleMapDescriptor_create :: proc(options: cffi.uint) -> ModuleMapDescriptor ---

    @(link_name="clang_ModuleMapDescriptor_setFrameworkModuleName")
    ModuleMapDescriptor_setFrameworkModuleName :: proc(_0: ModuleMapDescriptor, name: cstring) -> ErrorCode ---

    @(link_name="clang_ModuleMapDescriptor_setUmbrellaHeader")
    ModuleMapDescriptor_setUmbrellaHeader :: proc(_0: ModuleMapDescriptor, name: cstring) -> ErrorCode ---

    @(link_name="clang_ModuleMapDescriptor_writeToBuffer")
    ModuleMapDescriptor_writeToBuffer :: proc(_0: ModuleMapDescriptor, options: cffi.uint, out_buffer_ptr: ^cstring, out_buffer_size: ^cffi.uint) -> ErrorCode ---

    @(link_name="clang_ModuleMapDescriptor_dispose")
    ModuleMapDescriptor_dispose :: proc(_0: ModuleMapDescriptor) ---

    @(link_name="clang_getFileName")
    getFileName :: proc(SFile: File) -> String ---

    @(link_name="clang_getFileTime")
    getFileTime :: proc(SFile: File) -> time_t ---

    @(link_name="clang_getFileUniqueID")
    getFileUniqueID :: proc(file: File, outID: ^FileUniqueID) -> cffi.int ---

    @(link_name="clang_File_isEqual")
    File_isEqual :: proc(file1: File, file2: File) -> cffi.int ---

    @(link_name="clang_File_tryGetRealPathName")
    File_tryGetRealPathName :: proc(file: File) -> String ---

    @(link_name="clang_getNullLocation")
    getNullLocation :: proc() -> SourceLocation ---

    @(link_name="clang_equalLocations")
    equalLocations :: proc(loc1: SourceLocation, loc2: SourceLocation) -> cffi.uint ---

    @(link_name="clang_Location_isInSystemHeader")
    Location_isInSystemHeader :: proc(location: SourceLocation) -> cffi.int ---

    @(link_name="clang_Location_isFromMainFile")
    Location_isFromMainFile :: proc(location: SourceLocation) -> cffi.int ---

    @(link_name="clang_getNullRange")
    getNullRange :: proc() -> SourceRange ---

    @(link_name="clang_getRange")
    getRange :: proc(begin: SourceLocation, end: SourceLocation) -> SourceRange ---

    @(link_name="clang_equalRanges")
    equalRanges :: proc(range1: SourceRange, range2: SourceRange) -> cffi.uint ---

    @(link_name="clang_Range_isNull")
    Range_isNull :: proc(range: SourceRange) -> cffi.int ---

    @(link_name="clang_getExpansionLocation")
    getExpansionLocation :: proc(location: SourceLocation, file: ^File, line: ^cffi.uint, column: ^cffi.uint, offset: ^cffi.uint) ---

    @(link_name="clang_getPresumedLocation")
    getPresumedLocation :: proc(location: SourceLocation, filename: ^String, line: ^cffi.uint, column: ^cffi.uint) ---

    @(link_name="clang_getInstantiationLocation")
    getInstantiationLocation :: proc(location: SourceLocation, file: ^File, line: ^cffi.uint, column: ^cffi.uint, offset: ^cffi.uint) ---

    @(link_name="clang_getSpellingLocation")
    getSpellingLocation :: proc(location: SourceLocation, file: ^File, line: ^cffi.uint, column: ^cffi.uint, offset: ^cffi.uint) ---

    @(link_name="clang_getFileLocation")
    getFileLocation :: proc(location: SourceLocation, file: ^File, line: ^cffi.uint, column: ^cffi.uint, offset: ^cffi.uint) ---

    @(link_name="clang_getRangeStart")
    getRangeStart :: proc(range: SourceRange) -> SourceLocation ---

    @(link_name="clang_getRangeEnd")
    getRangeEnd :: proc(range: SourceRange) -> SourceLocation ---

    @(link_name="clang_disposeSourceRangeList")
    disposeSourceRangeList :: proc(ranges: ^SourceRangeList) ---

    @(link_name="clang_getNumDiagnosticsInSet")
    getNumDiagnosticsInSet :: proc(Diags: DiagnosticSet) -> cffi.uint ---

    @(require_results)
    @(link_name="clang_getDiagnosticInSet")
    getDiagnosticInSet :: proc(Diags: DiagnosticSet, _Index: cffi.uint) -> Diagnostic ---

    @(require_results)
    @(link_name="clang_loadDiagnostics")
    loadDiagnostics :: proc(file: cstring, error: ^LoadDiag_Error, errorString: ^String) -> DiagnosticSet ---

    @(link_name="clang_disposeDiagnosticSet")
    disposeDiagnosticSet :: proc(Diags: DiagnosticSet) ---

    @(require_results)
    @(link_name="clang_getChildDiagnostics")
    getChildDiagnostics :: proc(D: Diagnostic) -> DiagnosticSet ---

    @(link_name="clang_disposeDiagnostic")
    disposeDiagnostic :: proc(_Diagnostic: Diagnostic) ---

    @(link_name="clang_formatDiagnostic")
    formatDiagnostic :: proc(_Diagnostic: Diagnostic, Options: cffi.uint) -> String ---

    @(link_name="clang_defaultDiagnosticDisplayOptions")
    defaultDiagnosticDisplayOptions :: proc() -> cffi.uint ---

    @(link_name="clang_getDiagnosticSeverity")
    getDiagnosticSeverity :: proc(_0: Diagnostic) -> DiagnosticSeverity ---

    @(link_name="clang_getDiagnosticLocation")
    getDiagnosticLocation :: proc(_0: Diagnostic) -> SourceLocation ---

    @(link_name="clang_getDiagnosticSpelling")
    getDiagnosticSpelling :: proc(_0: Diagnostic) -> String ---

    @(link_name="clang_getDiagnosticOption")
    getDiagnosticOption :: proc(Diag: Diagnostic, Disable: ^String) -> String ---

    @(link_name="clang_getDiagnosticCategory")
    getDiagnosticCategory :: proc(_0: Diagnostic) -> cffi.uint ---

    @(link_name="clang_getDiagnosticCategoryName")
    getDiagnosticCategoryName :: proc(Category: cffi.uint) -> String ---

    @(link_name="clang_getDiagnosticCategoryText")
    getDiagnosticCategoryText :: proc(_0: Diagnostic) -> String ---

    @(link_name="clang_getDiagnosticNumRanges")
    getDiagnosticNumRanges :: proc(_0: Diagnostic) -> cffi.uint ---

    @(link_name="clang_getDiagnosticRange")
    getDiagnosticRange :: proc(_Diagnostic: Diagnostic, Range: cffi.uint) -> SourceRange ---

    @(link_name="clang_getDiagnosticNumFixIts")
    getDiagnosticNumFixIts :: proc(_Diagnostic: Diagnostic) -> cffi.uint ---

    @(link_name="clang_getDiagnosticFixIt")
    getDiagnosticFixIt :: proc(_Diagnostic: Diagnostic, FixIt: cffi.uint, ReplacementRange: ^SourceRange) -> String ---

    @(require_results)
    @(link_name="clang_createIndex")
    createIndex :: proc(excludeDeclarationsFromPCH: cffi.int, displayDiagnostics: cffi.int) -> Index ---

    @(link_name="clang_disposeIndex")
    disposeIndex :: proc(index: Index) ---

    @(link_name="clang_CXIndex_setGlobalOptions")
    CXIndex_setGlobalOptions :: proc(_0: Index, options: cffi.uint) ---

    @(link_name="clang_CXIndex_getGlobalOptions")
    CXIndex_getGlobalOptions :: proc(_0: Index) -> cffi.uint ---

    @(link_name="clang_CXIndex_setInvocationEmissionPathOption")
    CXIndex_setInvocationEmissionPathOption :: proc(_0: Index, Path: cstring) ---

    @(link_name="clang_isFileMultipleIncludeGuarded")
    isFileMultipleIncludeGuarded :: proc(tu: TranslationUnit, file: File) -> cffi.uint ---

    @(require_results)
    @(link_name="clang_getFile")
    getFile :: proc(tu: TranslationUnit, file_name: cstring) -> File ---

    @(require_results)
    @(link_name="clang_getFileContents")
    getFileContents :: proc(tu: TranslationUnit, file: File, size: ^cffi.size_t) -> cstring ---

    @(link_name="clang_getLocation")
    getLocation :: proc(tu: TranslationUnit, file: File, line: cffi.uint, column: cffi.uint) -> SourceLocation ---

    @(link_name="clang_getLocationForOffset")
    getLocationForOffset :: proc(tu: TranslationUnit, file: File, offset: cffi.uint) -> SourceLocation ---

    @(require_results)
    @(link_name="clang_getSkippedRanges")
    getSkippedRanges :: proc(tu: TranslationUnit, file: File) -> ^SourceRangeList ---

    @(require_results)
    @(link_name="clang_getAllSkippedRanges")
    getAllSkippedRanges :: proc(tu: TranslationUnit) -> ^SourceRangeList ---

    @(link_name="clang_getNumDiagnostics")
    getNumDiagnostics :: proc(Unit: TranslationUnit) -> cffi.uint ---

    @(require_results)
    @(link_name="clang_getDiagnostic")
    getDiagnostic :: proc(Unit: TranslationUnit, _Index: cffi.uint) -> Diagnostic ---

    @(require_results)
    @(link_name="clang_getDiagnosticSetFromTU")
    getDiagnosticSetFromTU :: proc(Unit: TranslationUnit) -> DiagnosticSet ---

    @(link_name="clang_getTranslationUnitSpelling")
    getTranslationUnitSpelling :: proc(CTUnit: TranslationUnit) -> String ---

    @(require_results)
    @(link_name="clang_createTranslationUnitFromSourceFile")
    createTranslationUnitFromSourceFile :: proc(CIdx: Index, source_filename: cstring, num_clang_command_line_args: cffi.int, clang_command_line_args: ^cstring, num_unsaved_files: cffi.uint, unsaved_files: ^UnsavedFile) -> TranslationUnit ---

    @(require_results)
    @(link_name="clang_createTranslationUnit")
    createTranslationUnit :: proc(CIdx: Index, ast_filename: cstring) -> TranslationUnit ---

    @(link_name="clang_createTranslationUnit2")
    createTranslationUnit2 :: proc(CIdx: Index, ast_filename: cstring, out_TU: ^TranslationUnit) -> ErrorCode ---

    @(link_name="clang_defaultEditingTranslationUnitOptions")
    defaultEditingTranslationUnitOptions :: proc() -> cffi.uint ---

    @(require_results)
    @(link_name="clang_parseTranslationUnit")
    parseTranslationUnit :: proc(CIdx: Index, source_filename: cstring, command_line_args: ^cstring, num_command_line_args: cffi.int, unsaved_files: ^UnsavedFile, num_unsaved_files: cffi.uint, options: cffi.uint) -> TranslationUnit ---

    @(link_name="clang_parseTranslationUnit2")
    parseTranslationUnit2 :: proc(CIdx: Index, source_filename: cstring, command_line_args: ^cstring, num_command_line_args: cffi.int, unsaved_files: ^UnsavedFile, num_unsaved_files: cffi.uint, options: cffi.uint, out_TU: ^TranslationUnit) -> ErrorCode ---

    @(link_name="clang_parseTranslationUnit2FullArgv")
    parseTranslationUnit2FullArgv :: proc(CIdx: Index, source_filename: cstring, command_line_args: ^cstring, num_command_line_args: cffi.int, unsaved_files: ^UnsavedFile, num_unsaved_files: cffi.uint, options: cffi.uint, out_TU: ^TranslationUnit) -> ErrorCode ---

    @(link_name="clang_defaultSaveOptions")
    defaultSaveOptions :: proc(TU: TranslationUnit) -> cffi.uint ---

    @(link_name="clang_saveTranslationUnit")
    saveTranslationUnit :: proc(TU: TranslationUnit, FileName: cstring, options: cffi.uint) -> cffi.int ---

    @(link_name="clang_suspendTranslationUnit")
    suspendTranslationUnit :: proc(_0: TranslationUnit) -> cffi.uint ---

    @(link_name="clang_disposeTranslationUnit")
    disposeTranslationUnit :: proc(_0: TranslationUnit) ---

    @(link_name="clang_defaultReparseOptions")
    defaultReparseOptions :: proc(TU: TranslationUnit) -> cffi.uint ---

    @(link_name="clang_reparseTranslationUnit")
    reparseTranslationUnit :: proc(TU: TranslationUnit, num_unsaved_files: cffi.uint, unsaved_files: ^UnsavedFile, options: cffi.uint) -> cffi.int ---

    @(require_results)
    @(link_name="clang_getTUResourceUsageName")
    getTUResourceUsageName :: proc(kind: TUResourceUsageKind) -> cstring ---

    @(link_name="clang_getCXTUResourceUsage")
    getCXTUResourceUsage :: proc(TU: TranslationUnit) -> TUResourceUsage ---

    @(link_name="clang_disposeCXTUResourceUsage")
    disposeCXTUResourceUsage :: proc(usage: TUResourceUsage) ---

    @(require_results)
    @(link_name="clang_getTranslationUnitTargetInfo")
    getTranslationUnitTargetInfo :: proc(CTUnit: TranslationUnit) -> TargetInfo ---

    @(link_name="clang_TargetInfo_dispose")
    TargetInfo_dispose :: proc(Info: TargetInfo) ---

    @(link_name="clang_TargetInfo_getTriple")
    TargetInfo_getTriple :: proc(Info: TargetInfo) -> String ---

    @(link_name="clang_TargetInfo_getPointerWidth")
    TargetInfo_getPointerWidth :: proc(Info: TargetInfo) -> cffi.int ---

    @(link_name="clang_getNullCursor")
    getNullCursor :: proc() -> Cursor ---

    @(link_name="clang_getTranslationUnitCursor")
    getTranslationUnitCursor :: proc(_0: TranslationUnit) -> Cursor ---

    @(link_name="clang_equalCursors")
    equalCursors :: proc(_0: Cursor, _1: Cursor) -> cffi.uint ---

    @(link_name="clang_Cursor_isNull")
    Cursor_isNull :: proc(cursor: Cursor) -> cffi.int ---

    @(link_name="clang_hashCursor")
    hashCursor :: proc(_0: Cursor) -> cffi.uint ---

    @(link_name="clang_getCursorKind")
    getCursorKind :: proc(_0: Cursor) -> CursorKind ---

    @(link_name="clang_isDeclaration")
    isDeclaration :: proc(_0: CursorKind) -> cffi.uint ---

    @(link_name="clang_isInvalidDeclaration")
    isInvalidDeclaration :: proc(_0: Cursor) -> cffi.uint ---

    @(link_name="clang_isReference")
    isReference :: proc(_0: CursorKind) -> cffi.uint ---

    @(link_name="clang_isExpression")
    isExpression :: proc(_0: CursorKind) -> cffi.uint ---

    @(link_name="clang_isStatement")
    isStatement :: proc(_0: CursorKind) -> cffi.uint ---

    @(link_name="clang_isAttribute")
    isAttribute :: proc(_0: CursorKind) -> cffi.uint ---

    @(link_name="clang_Cursor_hasAttrs")
    Cursor_hasAttrs :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_isInvalid")
    isInvalid :: proc(_0: CursorKind) -> cffi.uint ---

    @(link_name="clang_isTranslationUnit")
    isTranslationUnit :: proc(_0: CursorKind) -> cffi.uint ---

    @(link_name="clang_isPreprocessing")
    isPreprocessing :: proc(_0: CursorKind) -> cffi.uint ---

    @(link_name="clang_isUnexposed")
    isUnexposed :: proc(_0: CursorKind) -> cffi.uint ---

    @(link_name="clang_getCursorLinkage")
    getCursorLinkage :: proc(cursor: Cursor) -> LinkageKind ---

    @(link_name="clang_getCursorVisibility")
    getCursorVisibility :: proc(cursor: Cursor) -> VisibilityKind ---

    @(link_name="clang_getCursorAvailability")
    getCursorAvailability :: proc(cursor: Cursor) -> AvailabilityKind ---

    @(link_name="clang_getCursorPlatformAvailability")
    getCursorPlatformAvailability :: proc(cursor: Cursor, always_deprecated: ^cffi.int, deprecated_message: ^String, always_unavailable: ^cffi.int, unavailable_message: ^String, availability: ^PlatformAvailability, availability_size: cffi.int) -> cffi.int ---

    @(link_name="clang_disposeCXPlatformAvailability")
    disposeCXPlatformAvailability :: proc(availability: ^PlatformAvailability) ---

    @(link_name="clang_Cursor_getVarDeclInitializer")
    Cursor_getVarDeclInitializer :: proc(cursor: Cursor) -> Cursor ---

    @(link_name="clang_Cursor_hasVarDeclGlobalStorage")
    Cursor_hasVarDeclGlobalStorage :: proc(cursor: Cursor) -> cffi.int ---

    @(link_name="clang_Cursor_hasVarDeclExternalStorage")
    Cursor_hasVarDeclExternalStorage :: proc(cursor: Cursor) -> cffi.int ---

    @(link_name="clang_getCursorLanguage")
    getCursorLanguage :: proc(cursor: Cursor) -> LanguageKind ---

    @(link_name="clang_getCursorTLSKind")
    getCursorTLSKind :: proc(cursor: Cursor) -> TLSKind ---

    @(require_results)
    @(link_name="clang_Cursor_getTranslationUnit")
    Cursor_getTranslationUnit :: proc(_0: Cursor) -> TranslationUnit ---

    @(require_results)
    @(link_name="clang_createCXCursorSet")
    createCXCursorSet :: proc() -> CursorSet ---

    @(link_name="clang_disposeCXCursorSet")
    disposeCXCursorSet :: proc(cset: CursorSet) ---

    @(link_name="clang_CXCursorSet_contains")
    CXCursorSet_contains :: proc(cset: CursorSet, cursor: Cursor) -> cffi.uint ---

    @(link_name="clang_CXCursorSet_insert")
    CXCursorSet_insert :: proc(cset: CursorSet, cursor: Cursor) -> cffi.uint ---

    @(link_name="clang_getCursorSemanticParent")
    getCursorSemanticParent :: proc(cursor: Cursor) -> Cursor ---

    @(link_name="clang_getCursorLexicalParent")
    getCursorLexicalParent :: proc(cursor: Cursor) -> Cursor ---

    @(link_name="clang_getOverriddenCursors")
    getOverriddenCursors :: proc(cursor: Cursor, overridden: ^^Cursor, num_overridden: ^cffi.uint) ---

    @(link_name="clang_disposeOverriddenCursors")
    disposeOverriddenCursors :: proc(overridden: ^Cursor) ---

    @(require_results)
    @(link_name="clang_getIncludedFile")
    getIncludedFile :: proc(cursor: Cursor) -> File ---

    @(link_name="clang_getCursor")
    getCursor :: proc(_0: TranslationUnit, _1: SourceLocation) -> Cursor ---

    @(link_name="clang_getCursorLocation")
    getCursorLocation :: proc(_0: Cursor) -> SourceLocation ---

    @(link_name="clang_getCursorExtent")
    getCursorExtent :: proc(_0: Cursor) -> SourceRange ---

    @(link_name="clang_getCursorType")
    getCursorType :: proc(C: Cursor) -> Type ---

    @(link_name="clang_getTypeSpelling")
    getTypeSpelling :: proc(CT: Type) -> String ---

    @(link_name="clang_getTypedefDeclUnderlyingType")
    getTypedefDeclUnderlyingType :: proc(C: Cursor) -> Type ---

    @(link_name="clang_getEnumDeclIntegerType")
    getEnumDeclIntegerType :: proc(C: Cursor) -> Type ---

    @(link_name="clang_getEnumConstantDeclValue")
    getEnumConstantDeclValue :: proc(C: Cursor) -> cffi.longlong ---

    @(link_name="clang_getEnumConstantDeclUnsignedValue")
    getEnumConstantDeclUnsignedValue :: proc(C: Cursor) -> cffi.ulonglong ---

    @(link_name="clang_getFieldDeclBitWidth")
    getFieldDeclBitWidth :: proc(C: Cursor) -> cffi.int ---

    @(link_name="clang_Cursor_getNumArguments")
    Cursor_getNumArguments :: proc(C: Cursor) -> cffi.int ---

    @(link_name="clang_Cursor_getArgument")
    Cursor_getArgument :: proc(C: Cursor, i: cffi.uint) -> Cursor ---

    @(link_name="clang_Cursor_getNumTemplateArguments")
    Cursor_getNumTemplateArguments :: proc(C: Cursor) -> cffi.int ---

    @(link_name="clang_Cursor_getTemplateArgumentKind")
    Cursor_getTemplateArgumentKind :: proc(C: Cursor, I: cffi.uint) -> TemplateArgumentKind ---

    @(link_name="clang_Cursor_getTemplateArgumentType")
    Cursor_getTemplateArgumentType :: proc(C: Cursor, I: cffi.uint) -> Type ---

    @(link_name="clang_Cursor_getTemplateArgumentValue")
    Cursor_getTemplateArgumentValue :: proc(C: Cursor, I: cffi.uint) -> cffi.longlong ---

    @(link_name="clang_Cursor_getTemplateArgumentUnsignedValue")
    Cursor_getTemplateArgumentUnsignedValue :: proc(C: Cursor, I: cffi.uint) -> cffi.ulonglong ---

    @(link_name="clang_equalTypes")
    equalTypes :: proc(A: Type, B: Type) -> cffi.uint ---

    @(link_name="clang_getCanonicalType")
    getCanonicalType :: proc(T: Type) -> Type ---

    @(link_name="clang_isConstQualifiedType")
    isConstQualifiedType :: proc(T: Type) -> cffi.uint ---

    @(link_name="clang_Cursor_isMacroFunctionLike")
    Cursor_isMacroFunctionLike :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_Cursor_isMacroBuiltin")
    Cursor_isMacroBuiltin :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_Cursor_isFunctionInlined")
    Cursor_isFunctionInlined :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_isVolatileQualifiedType")
    isVolatileQualifiedType :: proc(T: Type) -> cffi.uint ---

    @(link_name="clang_isRestrictQualifiedType")
    isRestrictQualifiedType :: proc(T: Type) -> cffi.uint ---

    @(link_name="clang_getAddressSpace")
    getAddressSpace :: proc(T: Type) -> cffi.uint ---

    @(link_name="clang_getTypedefName")
    getTypedefName :: proc(CT: Type) -> String ---

    @(link_name="clang_getPointeeType")
    getPointeeType :: proc(T: Type) -> Type ---

    @(link_name="clang_getUnqualifiedType")
    getUnqualifiedType :: proc(CT: Type) -> Type ---

    @(link_name="clang_getNonReferenceType")
    getNonReferenceType :: proc(CT: Type) -> Type ---

    @(link_name="clang_getTypeDeclaration")
    getTypeDeclaration :: proc(T: Type) -> Cursor ---

    @(link_name="clang_getDeclObjCTypeEncoding")
    getDeclObjCTypeEncoding :: proc(C: Cursor) -> String ---

    @(link_name="clang_Type_getObjCEncoding")
    Type_getObjCEncoding :: proc(type: Type) -> String ---

    @(link_name="clang_getTypeKindSpelling")
    getTypeKindSpelling :: proc(K: TypeKind) -> String ---

    @(link_name="clang_getFunctionTypeCallingConv")
    getFunctionTypeCallingConv :: proc(T: Type) -> CallingConv ---

    @(link_name="clang_getResultType")
    getResultType :: proc(T: Type) -> Type ---

    @(link_name="clang_getExceptionSpecificationType")
    getExceptionSpecificationType :: proc(T: Type) -> cffi.int ---

    @(link_name="clang_getNumArgTypes")
    getNumArgTypes :: proc(T: Type) -> cffi.int ---

    @(link_name="clang_getArgType")
    getArgType :: proc(T: Type, i: cffi.uint) -> Type ---

    @(link_name="clang_Type_getObjCObjectBaseType")
    Type_getObjCObjectBaseType :: proc(T: Type) -> Type ---

    @(link_name="clang_Type_getNumObjCProtocolRefs")
    Type_getNumObjCProtocolRefs :: proc(T: Type) -> cffi.uint ---

    @(link_name="clang_Type_getObjCProtocolDecl")
    Type_getObjCProtocolDecl :: proc(T: Type, i: cffi.uint) -> Cursor ---

    @(link_name="clang_Type_getNumObjCTypeArgs")
    Type_getNumObjCTypeArgs :: proc(T: Type) -> cffi.uint ---

    @(link_name="clang_Type_getObjCTypeArg")
    Type_getObjCTypeArg :: proc(T: Type, i: cffi.uint) -> Type ---

    @(link_name="clang_isFunctionTypeVariadic")
    isFunctionTypeVariadic :: proc(T: Type) -> cffi.uint ---

    @(link_name="clang_getCursorResultType")
    getCursorResultType :: proc(C: Cursor) -> Type ---

    @(link_name="clang_getCursorExceptionSpecificationType")
    getCursorExceptionSpecificationType :: proc(C: Cursor) -> cffi.int ---

    @(link_name="clang_isPODType")
    isPODType :: proc(T: Type) -> cffi.uint ---

    @(link_name="clang_getElementType")
    getElementType :: proc(T: Type) -> Type ---

    @(link_name="clang_getNumElements")
    getNumElements :: proc(T: Type) -> cffi.longlong ---

    @(link_name="clang_getArrayElementType")
    getArrayElementType :: proc(T: Type) -> Type ---

    @(link_name="clang_getArraySize")
    getArraySize :: proc(T: Type) -> cffi.longlong ---

    @(link_name="clang_Type_getNamedType")
    Type_getNamedType :: proc(T: Type) -> Type ---

    @(link_name="clang_Type_isTransparentTagTypedef")
    Type_isTransparentTagTypedef :: proc(T: Type) -> cffi.uint ---

    @(link_name="clang_Type_getNullability")
    Type_getNullability :: proc(T: Type) -> TypeNullabilityKind ---

    @(link_name="clang_Type_getAlignOf")
    Type_getAlignOf :: proc(T: Type) -> cffi.longlong ---

    @(link_name="clang_Type_getClassType")
    Type_getClassType :: proc(T: Type) -> Type ---

    @(link_name="clang_Type_getSizeOf")
    Type_getSizeOf :: proc(T: Type) -> cffi.longlong ---

    @(link_name="clang_Type_getOffsetOf")
    Type_getOffsetOf :: proc(T: Type, S: cstring) -> cffi.longlong ---

    @(link_name="clang_Type_getModifiedType")
    Type_getModifiedType :: proc(T: Type) -> Type ---

    @(link_name="clang_Type_getValueType")
    Type_getValueType :: proc(CT: Type) -> Type ---

    @(link_name="clang_Cursor_getOffsetOfField")
    Cursor_getOffsetOfField :: proc(C: Cursor) -> cffi.longlong ---

    @(link_name="clang_Cursor_isAnonymous")
    Cursor_isAnonymous :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_Cursor_isAnonymousRecordDecl")
    Cursor_isAnonymousRecordDecl :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_Cursor_isInlineNamespace")
    Cursor_isInlineNamespace :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_Type_getNumTemplateArguments")
    Type_getNumTemplateArguments :: proc(T: Type) -> cffi.int ---

    @(link_name="clang_Type_getTemplateArgumentAsType")
    Type_getTemplateArgumentAsType :: proc(T: Type, i: cffi.uint) -> Type ---

    @(link_name="clang_Type_getCXXRefQualifier")
    Type_getCXXRefQualifier :: proc(T: Type) -> RefQualifierKind ---

    @(link_name="clang_Cursor_isBitField")
    Cursor_isBitField :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_isVirtualBase")
    isVirtualBase :: proc(_0: Cursor) -> cffi.uint ---

    @(link_name="clang_getCXXAccessSpecifier")
    getCXXAccessSpecifier :: proc(_0: Cursor) -> CXXAccessSpecifier ---

    @(link_name="clang_Cursor_getStorageClass")
    Cursor_getStorageClass :: proc(_0: Cursor) -> StorageClass ---

    @(link_name="clang_getNumOverloadedDecls")
    getNumOverloadedDecls :: proc(cursor: Cursor) -> cffi.uint ---

    @(link_name="clang_getOverloadedDecl")
    getOverloadedDecl :: proc(cursor: Cursor, index: cffi.uint) -> Cursor ---

    @(link_name="clang_getIBOutletCollectionType")
    getIBOutletCollectionType :: proc(_0: Cursor) -> Type ---

    @(link_name="clang_visitChildren")
    visitChildren :: proc(parent: Cursor, visitor: CursorVisitor, client_data: ClientData) -> cffi.uint ---

    @(link_name="clang_visitChildrenWithBlock")
    visitChildrenWithBlock :: proc(parent: Cursor, block: CursorVisitorBlock) -> cffi.uint ---

    @(link_name="clang_getCursorUSR")
    getCursorUSR :: proc(_0: Cursor) -> String ---

    @(link_name="clang_constructUSR_ObjCClass")
    constructUSR_ObjCClass :: proc(class_name: cstring) -> String ---

    @(link_name="clang_constructUSR_ObjCCategory")
    constructUSR_ObjCCategory :: proc(class_name: cstring, category_name: cstring) -> String ---

    @(link_name="clang_constructUSR_ObjCProtocol")
    constructUSR_ObjCProtocol :: proc(protocol_name: cstring) -> String ---

    @(link_name="clang_constructUSR_ObjCIvar")
    constructUSR_ObjCIvar :: proc(name: cstring, classUSR: String) -> String ---

    @(link_name="clang_constructUSR_ObjCMethod")
    constructUSR_ObjCMethod :: proc(name: cstring, isInstanceMethod: cffi.uint, classUSR: String) -> String ---

    @(link_name="clang_constructUSR_ObjCProperty")
    constructUSR_ObjCProperty :: proc(property: cstring, classUSR: String) -> String ---

    @(link_name="clang_getCursorSpelling")
    getCursorSpelling :: proc(_0: Cursor) -> String ---

    @(link_name="clang_Cursor_getSpellingNameRange")
    Cursor_getSpellingNameRange :: proc(_0: Cursor, pieceIndex: cffi.uint, options: cffi.uint) -> SourceRange ---

    @(link_name="clang_PrintingPolicy_getProperty")
    PrintingPolicy_getProperty :: proc(Policy: PrintingPolicy, Property: PrintingPolicyProperty) -> cffi.uint ---

    @(link_name="clang_PrintingPolicy_setProperty")
    PrintingPolicy_setProperty :: proc(Policy: PrintingPolicy, Property: PrintingPolicyProperty, Value: cffi.uint) ---

    @(require_results)
    @(link_name="clang_getCursorPrintingPolicy")
    getCursorPrintingPolicy :: proc(_0: Cursor) -> PrintingPolicy ---

    @(link_name="clang_PrintingPolicy_dispose")
    PrintingPolicy_dispose :: proc(Policy: PrintingPolicy) ---

    @(link_name="clang_getCursorPrettyPrinted")
    getCursorPrettyPrinted :: proc(_Cursor: Cursor, Policy: PrintingPolicy) -> String ---

    @(link_name="clang_getCursorDisplayName")
    getCursorDisplayName :: proc(_0: Cursor) -> String ---

    @(link_name="clang_getCursorReferenced")
    getCursorReferenced :: proc(_0: Cursor) -> Cursor ---

    @(link_name="clang_getCursorDefinition")
    getCursorDefinition :: proc(_0: Cursor) -> Cursor ---

    @(link_name="clang_isCursorDefinition")
    isCursorDefinition :: proc(_0: Cursor) -> cffi.uint ---

    @(link_name="clang_getCanonicalCursor")
    getCanonicalCursor :: proc(_0: Cursor) -> Cursor ---

    @(link_name="clang_Cursor_getObjCSelectorIndex")
    Cursor_getObjCSelectorIndex :: proc(_0: Cursor) -> cffi.int ---

    @(link_name="clang_Cursor_isDynamicCall")
    Cursor_isDynamicCall :: proc(C: Cursor) -> cffi.int ---

    @(link_name="clang_Cursor_getReceiverType")
    Cursor_getReceiverType :: proc(C: Cursor) -> Type ---

    @(link_name="clang_Cursor_getObjCPropertyAttributes")
    Cursor_getObjCPropertyAttributes :: proc(C: Cursor, reserved: cffi.uint) -> cffi.uint ---

    @(link_name="clang_Cursor_getObjCPropertyGetterName")
    Cursor_getObjCPropertyGetterName :: proc(C: Cursor) -> String ---

    @(link_name="clang_Cursor_getObjCPropertySetterName")
    Cursor_getObjCPropertySetterName :: proc(C: Cursor) -> String ---

    @(link_name="clang_Cursor_getObjCDeclQualifiers")
    Cursor_getObjCDeclQualifiers :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_Cursor_isObjCOptional")
    Cursor_isObjCOptional :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_Cursor_isVariadic")
    Cursor_isVariadic :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_Cursor_isExternalSymbol")
    Cursor_isExternalSymbol :: proc(C: Cursor, language: ^String, definedIn: ^String, isGenerated: ^cffi.uint) -> cffi.uint ---

    @(link_name="clang_Cursor_getCommentRange")
    Cursor_getCommentRange :: proc(C: Cursor) -> SourceRange ---

    @(link_name="clang_Cursor_getRawCommentText")
    Cursor_getRawCommentText :: proc(C: Cursor) -> String ---

    @(link_name="clang_Cursor_getBriefCommentText")
    Cursor_getBriefCommentText :: proc(C: Cursor) -> String ---

    @(link_name="clang_Cursor_getMangling")
    Cursor_getMangling :: proc(_0: Cursor) -> String ---

    @(require_results)
    @(link_name="clang_Cursor_getCXXManglings")
    Cursor_getCXXManglings :: proc(_0: Cursor) -> ^StringSet ---

    @(require_results)
    @(link_name="clang_Cursor_getObjCManglings")
    Cursor_getObjCManglings :: proc(_0: Cursor) -> ^StringSet ---

    @(require_results)
    @(link_name="clang_Cursor_getModule")
    Cursor_getModule :: proc(C: Cursor) -> Module ---

    @(require_results)
    @(link_name="clang_getModuleForFile")
    getModuleForFile :: proc(_0: TranslationUnit, _1: File) -> Module ---

    @(require_results)
    @(link_name="clang_Module_getASTFile")
    Module_getASTFile :: proc(_Module: Module) -> File ---

    @(require_results)
    @(link_name="clang_Module_getParent")
    Module_getParent :: proc(_Module: Module) -> Module ---

    @(link_name="clang_Module_getName")
    Module_getName :: proc(_Module: Module) -> String ---

    @(link_name="clang_Module_getFullName")
    Module_getFullName :: proc(_Module: Module) -> String ---

    @(link_name="clang_Module_isSystem")
    Module_isSystem :: proc(_Module: Module) -> cffi.int ---

    @(link_name="clang_Module_getNumTopLevelHeaders")
    Module_getNumTopLevelHeaders :: proc(_0: TranslationUnit, _Module: Module) -> cffi.uint ---

    @(require_results)
    @(link_name="clang_Module_getTopLevelHeader")
    Module_getTopLevelHeader :: proc(_0: TranslationUnit, _Module: Module, _Index: cffi.uint) -> File ---

    @(link_name="clang_CXXConstructor_isConvertingConstructor")
    CXXConstructor_isConvertingConstructor :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXConstructor_isCopyConstructor")
    CXXConstructor_isCopyConstructor :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXConstructor_isDefaultConstructor")
    CXXConstructor_isDefaultConstructor :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXConstructor_isMoveConstructor")
    CXXConstructor_isMoveConstructor :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXField_isMutable")
    CXXField_isMutable :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXMethod_isDefaulted")
    CXXMethod_isDefaulted :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXMethod_isDeleted")
    CXXMethod_isDeleted :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXMethod_isPureVirtual")
    CXXMethod_isPureVirtual :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXMethod_isStatic")
    CXXMethod_isStatic :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXMethod_isVirtual")
    CXXMethod_isVirtual :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXMethod_isCopyAssignmentOperator")
    CXXMethod_isCopyAssignmentOperator :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXMethod_isMoveAssignmentOperator")
    CXXMethod_isMoveAssignmentOperator :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXRecord_isAbstract")
    CXXRecord_isAbstract :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_EnumDecl_isScoped")
    EnumDecl_isScoped :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_CXXMethod_isConst")
    CXXMethod_isConst :: proc(C: Cursor) -> cffi.uint ---

    @(link_name="clang_getTemplateCursorKind")
    getTemplateCursorKind :: proc(C: Cursor) -> CursorKind ---

    @(link_name="clang_getSpecializedCursorTemplate")
    getSpecializedCursorTemplate :: proc(C: Cursor) -> Cursor ---

    @(link_name="clang_getCursorReferenceNameRange")
    getCursorReferenceNameRange :: proc(C: Cursor, NameFlags: cffi.uint, PieceIndex: cffi.uint) -> SourceRange ---

    @(require_results)
    @(link_name="clang_getToken")
    getToken :: proc(TU: TranslationUnit, Location: SourceLocation) -> ^Token ---

    @(link_name="clang_getTokenKind")
    getTokenKind :: proc(_0: Token) -> TokenKind ---

    @(link_name="clang_getTokenSpelling")
    getTokenSpelling :: proc(_0: TranslationUnit, _1: Token) -> String ---

    @(link_name="clang_getTokenLocation")
    getTokenLocation :: proc(_0: TranslationUnit, _1: Token) -> SourceLocation ---

    @(link_name="clang_getTokenExtent")
    getTokenExtent :: proc(_0: TranslationUnit, _1: Token) -> SourceRange ---

    @(link_name="clang_tokenize")
    tokenize :: proc(TU: TranslationUnit, Range: SourceRange, Tokens: ^^Token, NumTokens: ^cffi.uint) ---

    @(link_name="clang_annotateTokens")
    annotateTokens :: proc(TU: TranslationUnit, Tokens: ^Token, NumTokens: cffi.uint, Cursors: ^Cursor) ---

    @(link_name="clang_disposeTokens")
    disposeTokens :: proc(TU: TranslationUnit, Tokens: ^Token, NumTokens: cffi.uint) ---

    @(link_name="clang_getCursorKindSpelling")
    getCursorKindSpelling :: proc(Kind: CursorKind) -> String ---

    @(link_name="clang_getDefinitionSpellingAndExtent")
    getDefinitionSpellingAndExtent :: proc(_0: Cursor, startBuf: ^cstring, endBuf: ^cstring, startLine: ^cffi.uint, startColumn: ^cffi.uint, endLine: ^cffi.uint, endColumn: ^cffi.uint) ---

    @(link_name="clang_enableStackTraces")
    enableStackTraces :: proc() ---

    @(link_name="clang_executeOnThread")
    executeOnThread :: proc(fn: proc "c" (_arg_0: rawptr), user_data: rawptr, stack_size: cffi.uint) ---

    @(link_name="clang_getCompletionChunkKind")
    getCompletionChunkKind :: proc(completion_string: CompletionString, chunk_number: cffi.uint) -> CompletionChunkKind ---

    @(link_name="clang_getCompletionChunkText")
    getCompletionChunkText :: proc(completion_string: CompletionString, chunk_number: cffi.uint) -> String ---

    @(require_results)
    @(link_name="clang_getCompletionChunkCompletionString")
    getCompletionChunkCompletionString :: proc(completion_string: CompletionString, chunk_number: cffi.uint) -> CompletionString ---

    @(link_name="clang_getNumCompletionChunks")
    getNumCompletionChunks :: proc(completion_string: CompletionString) -> cffi.uint ---

    @(link_name="clang_getCompletionPriority")
    getCompletionPriority :: proc(completion_string: CompletionString) -> cffi.uint ---

    @(link_name="clang_getCompletionAvailability")
    getCompletionAvailability :: proc(completion_string: CompletionString) -> AvailabilityKind ---

    @(link_name="clang_getCompletionNumAnnotations")
    getCompletionNumAnnotations :: proc(completion_string: CompletionString) -> cffi.uint ---

    @(link_name="clang_getCompletionAnnotation")
    getCompletionAnnotation :: proc(completion_string: CompletionString, annotation_number: cffi.uint) -> String ---

    @(link_name="clang_getCompletionParent")
    getCompletionParent :: proc(completion_string: CompletionString, kind: ^CursorKind) -> String ---

    @(link_name="clang_getCompletionBriefComment")
    getCompletionBriefComment :: proc(completion_string: CompletionString) -> String ---

    @(require_results)
    @(link_name="clang_getCursorCompletionString")
    getCursorCompletionString :: proc(cursor: Cursor) -> CompletionString ---

    @(link_name="clang_getCompletionNumFixIts")
    getCompletionNumFixIts :: proc(results: ^CodeCompleteResults, completion_index: cffi.uint) -> cffi.uint ---

    @(link_name="clang_getCompletionFixIt")
    getCompletionFixIt :: proc(results: ^CodeCompleteResults, completion_index: cffi.uint, fixit_index: cffi.uint, replacement_range: ^SourceRange) -> String ---

    @(link_name="clang_defaultCodeCompleteOptions")
    defaultCodeCompleteOptions :: proc() -> cffi.uint ---

    @(require_results)
    @(link_name="clang_codeCompleteAt")
    codeCompleteAt :: proc(TU: TranslationUnit, complete_filename: cstring, complete_line: cffi.uint, complete_column: cffi.uint, unsaved_files: ^UnsavedFile, num_unsaved_files: cffi.uint, options: cffi.uint) -> ^CodeCompleteResults ---

    @(link_name="clang_sortCodeCompletionResults")
    sortCodeCompletionResults :: proc(Results: ^CompletionResult, NumResults: cffi.uint) ---

    @(link_name="clang_disposeCodeCompleteResults")
    disposeCodeCompleteResults :: proc(Results: ^CodeCompleteResults) ---

    @(link_name="clang_codeCompleteGetNumDiagnostics")
    codeCompleteGetNumDiagnostics :: proc(Results: ^CodeCompleteResults) -> cffi.uint ---

    @(require_results)
    @(link_name="clang_codeCompleteGetDiagnostic")
    codeCompleteGetDiagnostic :: proc(Results: ^CodeCompleteResults, _Index: cffi.uint) -> Diagnostic ---

    @(link_name="clang_codeCompleteGetContexts")
    codeCompleteGetContexts :: proc(Results: ^CodeCompleteResults) -> cffi.ulonglong ---

    @(link_name="clang_codeCompleteGetContainerKind")
    codeCompleteGetContainerKind :: proc(Results: ^CodeCompleteResults, IsIncomplete: ^cffi.uint) -> CursorKind ---

    @(link_name="clang_codeCompleteGetContainerUSR")
    codeCompleteGetContainerUSR :: proc(Results: ^CodeCompleteResults) -> String ---

    @(link_name="clang_codeCompleteGetObjCSelector")
    codeCompleteGetObjCSelector :: proc(Results: ^CodeCompleteResults) -> String ---

    @(link_name="clang_getClangVersion")
    getClangVersion :: proc() -> String ---

    @(link_name="clang_toggleCrashRecovery")
    toggleCrashRecovery :: proc(isEnabled: cffi.uint) ---

    @(link_name="clang_getInclusions")
    getInclusions :: proc(tu: TranslationUnit, visitor: InclusionVisitor, client_data: ClientData) ---

    @(require_results)
    @(link_name="clang_Cursor_Evaluate")
    Cursor_Evaluate :: proc(C: Cursor) -> EvalResult ---

    @(link_name="clang_EvalResult_getKind")
    EvalResult_getKind :: proc(E: EvalResult) -> EvalResultKind ---

    @(link_name="clang_EvalResult_getAsInt")
    EvalResult_getAsInt :: proc(E: EvalResult) -> cffi.int ---

    @(link_name="clang_EvalResult_getAsLongLong")
    EvalResult_getAsLongLong :: proc(E: EvalResult) -> cffi.longlong ---

    @(link_name="clang_EvalResult_isUnsignedInt")
    EvalResult_isUnsignedInt :: proc(E: EvalResult) -> cffi.uint ---

    @(link_name="clang_EvalResult_getAsUnsigned")
    EvalResult_getAsUnsigned :: proc(E: EvalResult) -> cffi.ulonglong ---

    @(link_name="clang_EvalResult_getAsDouble")
    EvalResult_getAsDouble :: proc(E: EvalResult) -> cffi.double ---

    @(require_results)
    @(link_name="clang_EvalResult_getAsStr")
    EvalResult_getAsStr :: proc(E: EvalResult) -> cstring ---

    @(link_name="clang_EvalResult_dispose")
    EvalResult_dispose :: proc(E: EvalResult) ---

    @(require_results)
    @(link_name="clang_getRemappings")
    getRemappings :: proc(path: cstring) -> Remapping ---

    @(require_results)
    @(link_name="clang_getRemappingsFromFileList")
    getRemappingsFromFileList :: proc(filePaths: ^cstring, numFiles: cffi.uint) -> Remapping ---

    @(link_name="clang_remap_getNumFiles")
    remap_getNumFiles :: proc(_0: Remapping) -> cffi.uint ---

    @(link_name="clang_remap_getFilenames")
    remap_getFilenames :: proc(_0: Remapping, index: cffi.uint, original: ^String, transformed: ^String) ---

    @(link_name="clang_remap_dispose")
    remap_dispose :: proc(_0: Remapping) ---

    @(link_name="clang_findReferencesInFile")
    findReferencesInFile :: proc(cursor: Cursor, file: File, visitor: CursorAndRangeVisitor) -> Result ---

    @(link_name="clang_findIncludesInFile")
    findIncludesInFile :: proc(TU: TranslationUnit, file: File, visitor: CursorAndRangeVisitor) -> Result ---

    @(link_name="clang_findReferencesInFileWithBlock")
    findReferencesInFileWithBlock :: proc(_0: Cursor, _1: File, _2: CursorAndRangeVisitorBlock) -> Result ---

    @(link_name="clang_findIncludesInFileWithBlock")
    findIncludesInFileWithBlock :: proc(_0: TranslationUnit, _1: File, _2: CursorAndRangeVisitorBlock) -> Result ---

    @(link_name="clang_index_isEntityObjCContainerKind")
    index_isEntityObjCContainerKind :: proc(_0: IdxEntityKind) -> cffi.int ---

    @(require_results)
    @(link_name="clang_index_getObjCContainerDeclInfo")
    index_getObjCContainerDeclInfo :: proc(_0: ^IdxDeclInfo) -> ^IdxObjCContainerDeclInfo ---

    @(require_results)
    @(link_name="clang_index_getObjCInterfaceDeclInfo")
    index_getObjCInterfaceDeclInfo :: proc(_0: ^IdxDeclInfo) -> ^IdxObjCInterfaceDeclInfo ---

    @(require_results)
    @(link_name="clang_index_getObjCCategoryDeclInfo")
    index_getObjCCategoryDeclInfo :: proc(_0: ^IdxDeclInfo) -> ^IdxObjCCategoryDeclInfo ---

    @(require_results)
    @(link_name="clang_index_getObjCProtocolRefListInfo")
    index_getObjCProtocolRefListInfo :: proc(_0: ^IdxDeclInfo) -> ^IdxObjCProtocolRefListInfo ---

    @(require_results)
    @(link_name="clang_index_getObjCPropertyDeclInfo")
    index_getObjCPropertyDeclInfo :: proc(_0: ^IdxDeclInfo) -> ^IdxObjCPropertyDeclInfo ---

    @(require_results)
    @(link_name="clang_index_getIBOutletCollectionAttrInfo")
    index_getIBOutletCollectionAttrInfo :: proc(_0: ^IdxAttrInfo) -> ^IdxIBOutletCollectionAttrInfo ---

    @(require_results)
    @(link_name="clang_index_getCXXClassDeclInfo")
    index_getCXXClassDeclInfo :: proc(_0: ^IdxDeclInfo) -> ^IdxCXXClassDeclInfo ---

    @(require_results)
    @(link_name="clang_index_getClientContainer")
    index_getClientContainer :: proc(_0: ^IdxContainerInfo) -> IdxClientContainer ---

    @(link_name="clang_index_setClientContainer")
    index_setClientContainer :: proc(_0: ^IdxContainerInfo, _1: IdxClientContainer) ---

    @(require_results)
    @(link_name="clang_index_getClientEntity")
    index_getClientEntity :: proc(_0: ^IdxEntityInfo) -> IdxClientEntity ---

    @(link_name="clang_index_setClientEntity")
    index_setClientEntity :: proc(_0: ^IdxEntityInfo, _1: IdxClientEntity) ---

    @(require_results)
    @(link_name="clang_IndexAction_create")
    IndexAction_create :: proc(CIdx: Index) -> IndexAction ---

    @(link_name="clang_IndexAction_dispose")
    IndexAction_dispose :: proc(_0: IndexAction) ---

    @(link_name="clang_indexSourceFile")
    indexSourceFile :: proc(_0: IndexAction, client_data: ClientData, index_callbacks: ^IndexerCallbacks, index_callbacks_size: cffi.uint, index_options: cffi.uint, source_filename: cstring, command_line_args: ^cstring, num_command_line_args: cffi.int, unsaved_files: ^UnsavedFile, num_unsaved_files: cffi.uint, out_TU: ^TranslationUnit, TU_options: cffi.uint) -> cffi.int ---

    @(link_name="clang_indexSourceFileFullArgv")
    indexSourceFileFullArgv :: proc(_0: IndexAction, client_data: ClientData, index_callbacks: ^IndexerCallbacks, index_callbacks_size: cffi.uint, index_options: cffi.uint, source_filename: cstring, command_line_args: ^cstring, num_command_line_args: cffi.int, unsaved_files: ^UnsavedFile, num_unsaved_files: cffi.uint, out_TU: ^TranslationUnit, TU_options: cffi.uint) -> cffi.int ---

    @(link_name="clang_indexTranslationUnit")
    indexTranslationUnit :: proc(_0: IndexAction, client_data: ClientData, index_callbacks: ^IndexerCallbacks, index_callbacks_size: cffi.uint, index_options: cffi.uint, _1: TranslationUnit) -> cffi.int ---

    @(link_name="clang_indexLoc_getFileLocation")
    indexLoc_getFileLocation :: proc(loc: IdxLoc, indexFile: ^IdxClientFile, file: ^File, line: ^cffi.uint, column: ^cffi.uint, offset: ^cffi.uint) ---

    @(link_name="clang_indexLoc_getCXSourceLocation")
    indexLoc_getCXSourceLocation :: proc(loc: IdxLoc) -> SourceLocation ---

    @(link_name="clang_Type_visitFields")
    Type_visitFields :: proc(T: Type, visitor: FieldVisitor, client_data: ClientData) -> cffi.uint ---

    @(require_results)
    @(link_name="clang_CompilationDatabase_fromDirectory")
    CompilationDatabase_fromDirectory :: proc(BuildDir: cstring, _ErrorCode: ^CompilationDatabase_Error) -> CompilationDatabase ---

    @(link_name="clang_CompilationDatabase_dispose")
    CompilationDatabase_dispose :: proc(_0: CompilationDatabase) ---

    @(require_results)
    @(link_name="clang_CompilationDatabase_getCompileCommands")
    CompilationDatabase_getCompileCommands :: proc(_0: CompilationDatabase, CompleteFileName: cstring) -> CompileCommands ---

    @(require_results)
    @(link_name="clang_CompilationDatabase_getAllCompileCommands")
    CompilationDatabase_getAllCompileCommands :: proc(_0: CompilationDatabase) -> CompileCommands ---

    @(link_name="clang_CompileCommands_dispose")
    CompileCommands_dispose :: proc(_0: CompileCommands) ---

    @(link_name="clang_CompileCommands_getSize")
    CompileCommands_getSize :: proc(_0: CompileCommands) -> cffi.uint ---

    @(require_results)
    @(link_name="clang_CompileCommands_getCommand")
    CompileCommands_getCommand :: proc(_0: CompileCommands, I: cffi.uint) -> CompileCommand ---

    @(link_name="clang_CompileCommand_getDirectory")
    CompileCommand_getDirectory :: proc(_0: CompileCommand) -> String ---

    @(link_name="clang_CompileCommand_getFilename")
    CompileCommand_getFilename :: proc(_0: CompileCommand) -> String ---

    @(link_name="clang_CompileCommand_getNumArgs")
    CompileCommand_getNumArgs :: proc(_0: CompileCommand) -> cffi.uint ---

    @(link_name="clang_CompileCommand_getArg")
    CompileCommand_getArg :: proc(_0: CompileCommand, I: cffi.uint) -> String ---

    @(link_name="clang_CompileCommand_getNumMappedSources")
    CompileCommand_getNumMappedSources :: proc(_0: CompileCommand) -> cffi.uint ---

    @(link_name="clang_CompileCommand_getMappedSourcePath")
    CompileCommand_getMappedSourcePath :: proc(_0: CompileCommand, I: cffi.uint) -> String ---

    @(link_name="clang_CompileCommand_getMappedSourceContent")
    CompileCommand_getMappedSourceContent :: proc(_0: CompileCommand, I: cffi.uint) -> String ---

    @(link_name="clang_Cursor_getParsedComment")
    Cursor_getParsedComment :: proc(C: Cursor) -> Comment ---

    @(link_name="clang_Comment_getKind")
    Comment_getKind :: proc(_Comment: Comment) -> CommentKind ---

    @(link_name="clang_Comment_getNumChildren")
    Comment_getNumChildren :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_Comment_getChild")
    Comment_getChild :: proc(_Comment: Comment, ChildIdx: cffi.uint) -> Comment ---

    @(link_name="clang_Comment_isWhitespace")
    Comment_isWhitespace :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_InlineContentComment_hasTrailingNewline")
    InlineContentComment_hasTrailingNewline :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_TextComment_getText")
    TextComment_getText :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_InlineCommandComment_getCommandName")
    InlineCommandComment_getCommandName :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_InlineCommandComment_getRenderKind")
    InlineCommandComment_getRenderKind :: proc(_Comment: Comment) -> CommentInlineCommandRenderKind ---

    @(link_name="clang_InlineCommandComment_getNumArgs")
    InlineCommandComment_getNumArgs :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_InlineCommandComment_getArgText")
    InlineCommandComment_getArgText :: proc(_Comment: Comment, ArgIdx: cffi.uint) -> String ---

    @(link_name="clang_HTMLTagComment_getTagName")
    HTMLTagComment_getTagName :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_HTMLStartTagComment_isSelfClosing")
    HTMLStartTagComment_isSelfClosing :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_HTMLStartTag_getNumAttrs")
    HTMLStartTag_getNumAttrs :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_HTMLStartTag_getAttrName")
    HTMLStartTag_getAttrName :: proc(_Comment: Comment, AttrIdx: cffi.uint) -> String ---

    @(link_name="clang_HTMLStartTag_getAttrValue")
    HTMLStartTag_getAttrValue :: proc(_Comment: Comment, AttrIdx: cffi.uint) -> String ---

    @(link_name="clang_BlockCommandComment_getCommandName")
    BlockCommandComment_getCommandName :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_BlockCommandComment_getNumArgs")
    BlockCommandComment_getNumArgs :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_BlockCommandComment_getArgText")
    BlockCommandComment_getArgText :: proc(_Comment: Comment, ArgIdx: cffi.uint) -> String ---

    @(link_name="clang_BlockCommandComment_getParagraph")
    BlockCommandComment_getParagraph :: proc(_Comment: Comment) -> Comment ---

    @(link_name="clang_ParamCommandComment_getParamName")
    ParamCommandComment_getParamName :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_ParamCommandComment_isParamIndexValid")
    ParamCommandComment_isParamIndexValid :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_ParamCommandComment_getParamIndex")
    ParamCommandComment_getParamIndex :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_ParamCommandComment_isDirectionExplicit")
    ParamCommandComment_isDirectionExplicit :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_ParamCommandComment_getDirection")
    ParamCommandComment_getDirection :: proc(_Comment: Comment) -> CommentParamPassDirection ---

    @(link_name="clang_TParamCommandComment_getParamName")
    TParamCommandComment_getParamName :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_TParamCommandComment_isParamPositionValid")
    TParamCommandComment_isParamPositionValid :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_TParamCommandComment_getDepth")
    TParamCommandComment_getDepth :: proc(_Comment: Comment) -> cffi.uint ---

    @(link_name="clang_TParamCommandComment_getIndex")
    TParamCommandComment_getIndex :: proc(_Comment: Comment, Depth: cffi.uint) -> cffi.uint ---

    @(link_name="clang_VerbatimBlockLineComment_getText")
    VerbatimBlockLineComment_getText :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_VerbatimLineComment_getText")
    VerbatimLineComment_getText :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_HTMLTagComment_getAsString")
    HTMLTagComment_getAsString :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_FullComment_getAsHTML")
    FullComment_getAsHTML :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_FullComment_getAsXML")
    FullComment_getAsXML :: proc(_Comment: Comment) -> String ---

    @(link_name="clang_createAPISet")
    createAPISet :: proc(tu: TranslationUnit, out_api: ^APISet) -> ErrorCode ---

    @(link_name="clang_disposeAPISet")
    disposeAPISet :: proc(api: APISet) ---

    @(link_name="clang_getSymbolGraphForUSR")
    getSymbolGraphForUSR :: proc(usr: cstring, api: APISet) -> String ---

    @(link_name="clang_getSymbolGraphForCursor")
    getSymbolGraphForCursor :: proc(cursor: Cursor) -> String ---

    @(link_name="clang_install_aborting_llvm_fatal_error_handler")
    install_aborting_llvm_fatal_error_handler :: proc() ---

    @(link_name="clang_uninstall_llvm_fatal_error_handler")
    uninstall_llvm_fatal_error_handler :: proc() ---

}

/// CXVirtualFileOverlay
VirtualFileOverlay :: ^VirtualFileOverlayImpl

/// CXModuleMapDescriptor
ModuleMapDescriptor :: ^ModuleMapDescriptorImpl

/// __darwin_time_t
__darwin_time_t :: cffi.long

/// time_t
time_t :: __darwin_time_t

/// CXFile
File :: rawptr

/// CXDiagnostic
Diagnostic :: rawptr

/// CXDiagnosticSet
DiagnosticSet :: rawptr

/// CXIndex
Index :: rawptr

/// CXTargetInfo
TargetInfo :: ^TargetInfoImpl

/// CXTranslationUnit
TranslationUnit :: ^TranslationUnitImpl

/// CXClientData
ClientData :: rawptr

/// CXCursorSet
CursorSet :: ^CursorSetImpl

/// CXCursorVisitor
CursorVisitor :: proc "c" (cursor: Cursor, parent: Cursor, client_data: ClientData) -> ChildVisitResult

/// CXCursorVisitorBlock
CursorVisitorBlock :: proc "c" (cursor: Cursor, parent: Cursor) -> ChildVisitResult

/// CXPrintingPolicy
PrintingPolicy :: rawptr

/// CXModule
Module :: rawptr

/// CXCompletionString
CompletionString :: rawptr

/// CXInclusionVisitor
InclusionVisitor :: proc "c" (included_file: File, inclusion_stack: ^SourceLocation, include_len: cffi.uint, client_data: ClientData)

/// CXEvalResult
EvalResult :: rawptr

/// CXRemapping
Remapping :: rawptr

/// CXCursorAndRangeVisitorBlock
CursorAndRangeVisitorBlock :: proc "c" (_arg_0: Cursor, _arg_1: SourceRange) -> VisitorResult

/// CXIdxClientFile
IdxClientFile :: rawptr

/// CXIdxClientEntity
IdxClientEntity :: rawptr

/// CXIdxClientContainer
IdxClientContainer :: rawptr

/// CXIdxClientASTFile
IdxClientASTFile :: rawptr

/// CXIndexAction
IndexAction :: rawptr

/// CXFieldVisitor
FieldVisitor :: proc "c" (C: Cursor, client_data: ClientData) -> VisitorResult

/// CXCompilationDatabase
CompilationDatabase :: rawptr

/// CXCompileCommands
CompileCommands :: rawptr

/// CXCompileCommand
CompileCommand :: rawptr

/// CXAPISet
APISet :: ^APISetImpl

/// CXGlobalOptFlags
GlobalOptFlag :: enum cffi.uint {
    ThreadBackgroundPriorityForIndexing = 0,
    ThreadBackgroundPriorityForEditing = 1,
}
GlobalOptFlags :: bit_set[GlobalOptFlag; cffi.uint]

GlobalOptFlag_ThreadBackgroundPriorityForAll :: GlobalOptFlags{ .ThreadBackgroundPriorityForIndexing, .ThreadBackgroundPriorityForEditing,  }

/// CXObjCPropertyAttrKind
ObjCPropertyAttrKind :: enum cffi.uint {
    noattr = 0,
    readonly = 1,
    getter = 2,
    assign = 4,
    readwrite = 8,
    retain = 16,
    copy = 32,
    nonatomic = 64,
    setter = 128,
    atomic = 256,
    weak = 512,
    strong = 1024,
    unsafe_unretained = 2048,
    class = 4096,
}

/// CXObjCDeclQualifierKind
ObjCDeclQualifierKind :: enum cffi.uint {
    None = 0,
    In = 1,
    Inout = 2,
    Out = 4,
    Bycopy = 8,
    Byref = 16,
    Oneway = 32,
}

/// CXTokenKind
TokenKind :: enum cffi.uint {
    Punctuation = 0,
    Keyword = 1,
    Identifier = 2,
    Literal = 3,
    Comment = 4,
}

/// CXEvalResultKind
EvalResultKind :: enum cffi.uint {
    Int = 1,
    Float = 2,
    ObjCStrLiteral = 3,
    StrLiteral = 4,
    CFStr = 5,
    Other = 6,
    UnExposed = 0,
}

/// CXResult
Result :: enum cffi.uint {
    Success = 0,
    Invalid = 1,
    VisitBreak = 2,
}

/// CXIdxEntityKind
IdxEntityKind :: enum cffi.uint {
    Unexposed = 0,
    Typedef = 1,
    Function = 2,
    Variable = 3,
    Field = 4,
    EnumConstant = 5,
    ObjCClass = 6,
    ObjCProtocol = 7,
    ObjCCategory = 8,
    ObjCInstanceMethod = 9,
    ObjCClassMethod = 10,
    ObjCProperty = 11,
    ObjCIvar = 12,
    Enum = 13,
    Struct = 14,
    Union = 15,
    CXXClass = 16,
    CXXNamespace = 17,
    CXXNamespaceAlias = 18,
    CXXStaticVariable = 19,
    CXXStaticMethod = 20,
    CXXInstanceMethod = 21,
    CXXConstructor = 22,
    CXXDestructor = 23,
    CXXConversionFunction = 24,
    CXXTypeAlias = 25,
    CXXInterface = 26,
    CXXConcept = 27,
}

/// CXIdxEntityLanguage
IdxEntityLanguage :: enum cffi.uint {
    None = 0,
    C = 1,
    ObjC = 2,
    CXX = 3,
    Swift = 4,
}

/// CXIdxEntityCXXTemplateKind
IdxEntityCXXTemplateKind :: enum cffi.uint {
    NonTemplate = 0,
    Template = 1,
    TemplatePartialSpecialization = 2,
    TemplateSpecialization = 3,
}

/// CXIdxAttrKind
IdxAttrKind :: enum cffi.uint {
    Unexposed = 0,
    IBAction = 1,
    IBOutlet = 2,
    IBOutletCollection = 3,
}

/// CXIdxDeclInfoFlags
IdxDeclInfoFlag :: enum cffi.uint {
    Flag_Skipped = 0,
}
IdxDeclInfoFlags :: bit_set[IdxDeclInfoFlag; cffi.uint]

/// CXIdxObjCContainerKind
IdxObjCContainerKind :: enum cffi.uint {
    ForwardRef = 0,
    Interface = 1,
    Implementation = 2,
}

/// CXIdxEntityRefKind
IdxEntityRefKind :: enum cffi.uint {
    Direct = 1,
    Implicit = 2,
}

/// CXSymbolRole
SymbolRoles :: enum cffi.uint {
    Declaration = 0,
    Definition = 1,
    Reference = 2,
    Read = 3,
    Write = 4,
    Call = 5,
    Dynamic = 6,
    AddressOf = 7,
    Implicit = 8,
}
SymbolRole :: bit_set[SymbolRoles; cffi.uint]

/// CXIndexOptFlags
IndexOptFlag :: enum cffi.uint {
    SuppressRedundantRefs = 0,
    IndexFunctionLocalSymbols = 1,
    IndexImplicitTemplateInstantiations = 2,
    SuppressWarnings = 3,
    SkipParsedBodiesInSession = 4,
}
IndexOptFlags :: bit_set[IndexOptFlag; cffi.uint]

/// CXCompilationDatabase_Error
CompilationDatabase_Error :: enum cffi.uint {
    NoError = 0,
    CanNotLoadDatabase = 1,
}

/// CXErrorCode
ErrorCode :: enum cffi.uint {
    Success = 0,
    Failure = 1,
    Crashed = 2,
    InvalidArguments = 3,
    ASTReadError = 4,
}

/// CXDiagnosticSeverity
DiagnosticSeverity :: enum cffi.uint {
    Ignored = 0,
    Note = 1,
    Warning = 2,
    Error = 3,
    Fatal = 4,
}

/// CXLoadDiag_Error
LoadDiag_Error :: enum cffi.uint {
    None = 0,
    Unknown = 1,
    CannotLoad = 2,
    InvalidFile = 3,
}

/// CXDiagnosticDisplayOptions
DiagnosticDisplayOption :: enum cffi.uint {
    SourceLocation = 0,
    Column = 1,
    SourceRanges = 2,
    Option = 3,
    CategoryId = 4,
    CategoryName = 5,
}
DiagnosticDisplayOptions :: bit_set[DiagnosticDisplayOption; cffi.uint]

/// CXAvailabilityKind
AvailabilityKind :: enum cffi.uint {
    Available = 0,
    Deprecated = 1,
    NotAvailable = 2,
    NotAccessible = 3,
}

/// CXCursor_ExceptionSpecificationKind
Cursor_ExceptionSpecificationKind :: enum cffi.uint {
    None = 0,
    DynamicNone = 1,
    Dynamic = 2,
    MSAny = 3,
    BasicNoexcept = 4,
    ComputedNoexcept = 5,
    Unevaluated = 6,
    Uninstantiated = 7,
    Unparsed = 8,
    NoThrow = 9,
}

/// CXTranslationUnit_Flags
TranslationUnit_Flag :: enum cffi.uint {
    DetailedPreprocessingRecord = 0,
    Incomplete = 1,
    PrecompiledPreamble = 2,
    CacheCompletionResults = 3,
    ForSerialization = 4,
    CXXChainedPCH = 5,
    SkipFunctionBodies = 6,
    IncludeBriefCommentsInCodeCompletion = 7,
    CreatePreambleOnFirstParse = 8,
    KeepGoing = 9,
    SingleFileParse = 10,
    LimitSkipFunctionBodiesToPreamble = 11,
    IncludeAttributedTypes = 12,
    VisitImplicitAttributes = 13,
    IgnoreNonErrorsFromIncludedFiles = 14,
    RetainExcludedConditionalBlocks = 15,
}
TranslationUnit_Flags :: bit_set[TranslationUnit_Flag; cffi.uint]

/// CXSaveTranslationUnit_Flags
SaveTranslationUnit_Flag :: enum cffi.uint {
}
SaveTranslationUnit_Flags :: bit_set[SaveTranslationUnit_Flag; cffi.uint]

/// CXSaveError
SaveError :: enum cffi.uint {
    None = 0,
    Unknown = 1,
    TranslationErrors = 2,
    InvalidTU = 3,
}

/// CXReparse_Flags
Reparse_Flag :: enum cffi.uint {
}
Reparse_Flags :: bit_set[Reparse_Flag; cffi.uint]

/// CXTUResourceUsageKind
TUResourceUsageKind :: enum cffi.uint {
    AST = 1,
    Identifiers = 2,
    Selectors = 3,
    GlobalCompletionResults = 4,
    SourceManagerContentCache = 5,
    AST_SideTables = 6,
    SourceManager_Membuffer_Malloc = 7,
    SourceManager_Membuffer_MMap = 8,
    ExternalASTSource_Membuffer_Malloc = 9,
    ExternalASTSource_Membuffer_MMap = 10,
    Preprocessor = 11,
    PreprocessingRecord = 12,
    SourceManager_DataStructures = 13,
    Preprocessor_HeaderSearch = 14,
    MEMORY_IN_BYTES_BEGIN = 1,
    MEMORY_IN_BYTES_END = 14,
    First = 1,
    Last = 14,
}

/// CXCursorKind
CursorKind :: enum cffi.uint {
    UnexposedDecl = 1,
    StructDecl = 2,
    UnionDecl = 3,
    ClassDecl = 4,
    EnumDecl = 5,
    FieldDecl = 6,
    EnumConstantDecl = 7,
    FunctionDecl = 8,
    VarDecl = 9,
    ParmDecl = 10,
    ObjCInterfaceDecl = 11,
    ObjCCategoryDecl = 12,
    ObjCProtocolDecl = 13,
    ObjCPropertyDecl = 14,
    ObjCIvarDecl = 15,
    ObjCInstanceMethodDecl = 16,
    ObjCClassMethodDecl = 17,
    ObjCImplementationDecl = 18,
    ObjCCategoryImplDecl = 19,
    TypedefDecl = 20,
    CXXMethod = 21,
    Namespace = 22,
    LinkageSpec = 23,
    Constructor = 24,
    Destructor = 25,
    ConversionFunction = 26,
    TemplateTypeParameter = 27,
    NonTypeTemplateParameter = 28,
    TemplateTemplateParameter = 29,
    FunctionTemplate = 30,
    ClassTemplate = 31,
    ClassTemplatePartialSpecialization = 32,
    NamespaceAlias = 33,
    UsingDirective = 34,
    UsingDeclaration = 35,
    TypeAliasDecl = 36,
    ObjCSynthesizeDecl = 37,
    ObjCDynamicDecl = 38,
    CXXAccessSpecifier = 39,
    FirstDecl = 1,
    LastDecl = 39,
    FirstRef = 40,
    ObjCSuperClassRef = 40,
    ObjCProtocolRef = 41,
    ObjCClassRef = 42,
    TypeRef = 43,
    CXXBaseSpecifier = 44,
    TemplateRef = 45,
    NamespaceRef = 46,
    MemberRef = 47,
    LabelRef = 48,
    OverloadedDeclRef = 49,
    VariableRef = 50,
    LastRef = 50,
    FirstInvalid = 70,
    InvalidFile = 70,
    NoDeclFound = 71,
    NotImplemented = 72,
    InvalidCode = 73,
    LastInvalid = 73,
    FirstExpr = 100,
    UnexposedExpr = 100,
    DeclRefExpr = 101,
    MemberRefExpr = 102,
    CallExpr = 103,
    ObjCMessageExpr = 104,
    BlockExpr = 105,
    IntegerLiteral = 106,
    FloatingLiteral = 107,
    ImaginaryLiteral = 108,
    StringLiteral = 109,
    CharacterLiteral = 110,
    ParenExpr = 111,
    UnaryOperator = 112,
    ArraySubscriptExpr = 113,
    BinaryOperator = 114,
    CompoundAssignOperator = 115,
    ConditionalOperator = 116,
    CStyleCastExpr = 117,
    CompoundLiteralExpr = 118,
    InitListExpr = 119,
    AddrLabelExpr = 120,
    StmtExpr = 121,
    GenericSelectionExpr = 122,
    GNUNullExpr = 123,
    CXXStaticCastExpr = 124,
    CXXDynamicCastExpr = 125,
    CXXReinterpretCastExpr = 126,
    CXXConstCastExpr = 127,
    CXXFunctionalCastExpr = 128,
    CXXTypeidExpr = 129,
    CXXBoolLiteralExpr = 130,
    CXXNullPtrLiteralExpr = 131,
    CXXThisExpr = 132,
    CXXThrowExpr = 133,
    CXXNewExpr = 134,
    CXXDeleteExpr = 135,
    UnaryExpr = 136,
    ObjCStringLiteral = 137,
    ObjCEncodeExpr = 138,
    ObjCSelectorExpr = 139,
    ObjCProtocolExpr = 140,
    ObjCBridgedCastExpr = 141,
    PackExpansionExpr = 142,
    SizeOfPackExpr = 143,
    LambdaExpr = 144,
    ObjCBoolLiteralExpr = 145,
    ObjCSelfExpr = 146,
    OMPArraySectionExpr = 147,
    ObjCAvailabilityCheckExpr = 148,
    FixedPointLiteral = 149,
    OMPArrayShapingExpr = 150,
    OMPIteratorExpr = 151,
    CXXAddrspaceCastExpr = 152,
    ConceptSpecializationExpr = 153,
    RequiresExpr = 154,
    CXXParenListInitExpr = 155,
    LastExpr = 155,
    FirstStmt = 200,
    UnexposedStmt = 200,
    LabelStmt = 201,
    CompoundStmt = 202,
    CaseStmt = 203,
    DefaultStmt = 204,
    IfStmt = 205,
    SwitchStmt = 206,
    WhileStmt = 207,
    DoStmt = 208,
    ForStmt = 209,
    GotoStmt = 210,
    IndirectGotoStmt = 211,
    ContinueStmt = 212,
    BreakStmt = 213,
    ReturnStmt = 214,
    GCCAsmStmt = 215,
    AsmStmt = 215,
    ObjCAtTryStmt = 216,
    ObjCAtCatchStmt = 217,
    ObjCAtFinallyStmt = 218,
    ObjCAtThrowStmt = 219,
    ObjCAtSynchronizedStmt = 220,
    ObjCAutoreleasePoolStmt = 221,
    ObjCForCollectionStmt = 222,
    CXXCatchStmt = 223,
    CXXTryStmt = 224,
    CXXForRangeStmt = 225,
    SEHTryStmt = 226,
    SEHExceptStmt = 227,
    SEHFinallyStmt = 228,
    MSAsmStmt = 229,
    NullStmt = 230,
    DeclStmt = 231,
    OMPParallelDirective = 232,
    OMPSimdDirective = 233,
    OMPForDirective = 234,
    OMPSectionsDirective = 235,
    OMPSectionDirective = 236,
    OMPSingleDirective = 237,
    OMPParallelForDirective = 238,
    OMPParallelSectionsDirective = 239,
    OMPTaskDirective = 240,
    OMPMasterDirective = 241,
    OMPCriticalDirective = 242,
    OMPTaskyieldDirective = 243,
    OMPBarrierDirective = 244,
    OMPTaskwaitDirective = 245,
    OMPFlushDirective = 246,
    SEHLeaveStmt = 247,
    OMPOrderedDirective = 248,
    OMPAtomicDirective = 249,
    OMPForSimdDirective = 250,
    OMPParallelForSimdDirective = 251,
    OMPTargetDirective = 252,
    OMPTeamsDirective = 253,
    OMPTaskgroupDirective = 254,
    OMPCancellationPointDirective = 255,
    OMPCancelDirective = 256,
    OMPTargetDataDirective = 257,
    OMPTaskLoopDirective = 258,
    OMPTaskLoopSimdDirective = 259,
    OMPDistributeDirective = 260,
    OMPTargetEnterDataDirective = 261,
    OMPTargetExitDataDirective = 262,
    OMPTargetParallelDirective = 263,
    OMPTargetParallelForDirective = 264,
    OMPTargetUpdateDirective = 265,
    OMPDistributeParallelForDirective = 266,
    OMPDistributeParallelForSimdDirective = 267,
    OMPDistributeSimdDirective = 268,
    OMPTargetParallelForSimdDirective = 269,
    OMPTargetSimdDirective = 270,
    OMPTeamsDistributeDirective = 271,
    OMPTeamsDistributeSimdDirective = 272,
    OMPTeamsDistributeParallelForSimdDirective = 273,
    OMPTeamsDistributeParallelForDirective = 274,
    OMPTargetTeamsDirective = 275,
    OMPTargetTeamsDistributeDirective = 276,
    OMPTargetTeamsDistributeParallelForDirective = 277,
    OMPTargetTeamsDistributeParallelForSimdDirective = 278,
    OMPTargetTeamsDistributeSimdDirective = 279,
    BuiltinBitCastExpr = 280,
    OMPMasterTaskLoopDirective = 281,
    OMPParallelMasterTaskLoopDirective = 282,
    OMPMasterTaskLoopSimdDirective = 283,
    OMPParallelMasterTaskLoopSimdDirective = 284,
    OMPParallelMasterDirective = 285,
    OMPDepobjDirective = 286,
    OMPScanDirective = 287,
    OMPTileDirective = 288,
    OMPCanonicalLoop = 289,
    OMPInteropDirective = 290,
    OMPDispatchDirective = 291,
    OMPMaskedDirective = 292,
    OMPUnrollDirective = 293,
    OMPMetaDirective = 294,
    OMPGenericLoopDirective = 295,
    OMPTeamsGenericLoopDirective = 296,
    OMPTargetTeamsGenericLoopDirective = 297,
    OMPParallelGenericLoopDirective = 298,
    OMPTargetParallelGenericLoopDirective = 299,
    OMPParallelMaskedDirective = 300,
    OMPMaskedTaskLoopDirective = 301,
    OMPMaskedTaskLoopSimdDirective = 302,
    OMPParallelMaskedTaskLoopDirective = 303,
    OMPParallelMaskedTaskLoopSimdDirective = 304,
    OMPErrorDirective = 305,
    LastStmt = 305,
    TranslationUnit = 350,
    FirstAttr = 400,
    UnexposedAttr = 400,
    IBActionAttr = 401,
    IBOutletAttr = 402,
    IBOutletCollectionAttr = 403,
    CXXFinalAttr = 404,
    CXXOverrideAttr = 405,
    AnnotateAttr = 406,
    AsmLabelAttr = 407,
    PackedAttr = 408,
    PureAttr = 409,
    ConstAttr = 410,
    NoDuplicateAttr = 411,
    CUDAConstantAttr = 412,
    CUDADeviceAttr = 413,
    CUDAGlobalAttr = 414,
    CUDAHostAttr = 415,
    CUDASharedAttr = 416,
    VisibilityAttr = 417,
    DLLExport = 418,
    DLLImport = 419,
    NSReturnsRetained = 420,
    NSReturnsNotRetained = 421,
    NSReturnsAutoreleased = 422,
    NSConsumesSelf = 423,
    NSConsumed = 424,
    ObjCException = 425,
    ObjCNSObject = 426,
    ObjCIndependentClass = 427,
    ObjCPreciseLifetime = 428,
    ObjCReturnsInnerPointer = 429,
    ObjCRequiresSuper = 430,
    ObjCRootClass = 431,
    ObjCSubclassingRestricted = 432,
    ObjCExplicitProtocolImpl = 433,
    ObjCDesignatedInitializer = 434,
    ObjCRuntimeVisible = 435,
    ObjCBoxable = 436,
    FlagEnum = 437,
    ConvergentAttr = 438,
    WarnUnusedAttr = 439,
    WarnUnusedResultAttr = 440,
    AlignedAttr = 441,
    LastAttr = 441,
    PreprocessingDirective = 500,
    MacroDefinition = 501,
    MacroExpansion = 502,
    MacroInstantiation = 502,
    InclusionDirective = 503,
    FirstPreprocessing = 500,
    LastPreprocessing = 503,
    ModuleImportDecl = 600,
    TypeAliasTemplateDecl = 601,
    StaticAssert = 602,
    FriendDecl = 603,
    ConceptDecl = 604,
    FirstExtraDecl = 600,
    LastExtraDecl = 604,
    OverloadCandidate = 700,
}

/// CXLinkageKind
LinkageKind :: enum cffi.uint {
    Invalid = 0,
    NoLinkage = 1,
    Internal = 2,
    UniqueExternal = 3,
    External = 4,
}

/// CXVisibilityKind
VisibilityKind :: enum cffi.uint {
    Invalid = 0,
    Hidden = 1,
    Protected = 2,
    Default = 3,
}

/// CXLanguageKind
LanguageKind :: enum cffi.uint {
    Invalid = 0,
    C = 1,
    ObjC = 2,
    CPlusPlus = 3,
}

/// CXTLSKind
TLSKind :: enum cffi.uint {
    None = 0,
    Dynamic = 1,
    Static = 2,
}

/// CXTypeKind
TypeKind :: enum cffi.uint {
    Invalid = 0,
    Unexposed = 1,
    Void = 2,
    Bool = 3,
    Char_U = 4,
    UChar = 5,
    Char16 = 6,
    Char32 = 7,
    UShort = 8,
    UInt = 9,
    ULong = 10,
    ULongLong = 11,
    UInt128 = 12,
    Char_S = 13,
    SChar = 14,
    WChar = 15,
    Short = 16,
    Int = 17,
    Long = 18,
    LongLong = 19,
    Int128 = 20,
    Float = 21,
    Double = 22,
    LongDouble = 23,
    NullPtr = 24,
    Overload = 25,
    Dependent = 26,
    ObjCId = 27,
    ObjCClass = 28,
    ObjCSel = 29,
    Float128 = 30,
    Half = 31,
    Float16 = 32,
    ShortAccum = 33,
    Accum = 34,
    LongAccum = 35,
    UShortAccum = 36,
    UAccum = 37,
    ULongAccum = 38,
    BFloat16 = 39,
    Ibm128 = 40,
    FirstBuiltin = 2,
    LastBuiltin = 40,
    Complex = 100,
    Pointer = 101,
    BlockPointer = 102,
    LValueReference = 103,
    RValueReference = 104,
    Record = 105,
    Enum = 106,
    Typedef = 107,
    ObjCInterface = 108,
    ObjCObjectPointer = 109,
    FunctionNoProto = 110,
    FunctionProto = 111,
    ConstantArray = 112,
    Vector = 113,
    IncompleteArray = 114,
    VariableArray = 115,
    DependentSizedArray = 116,
    MemberPointer = 117,
    Auto = 118,
    Elaborated = 119,
    Pipe = 120,
    OCLImage1dRO = 121,
    OCLImage1dArrayRO = 122,
    OCLImage1dBufferRO = 123,
    OCLImage2dRO = 124,
    OCLImage2dArrayRO = 125,
    OCLImage2dDepthRO = 126,
    OCLImage2dArrayDepthRO = 127,
    OCLImage2dMSAARO = 128,
    OCLImage2dArrayMSAARO = 129,
    OCLImage2dMSAADepthRO = 130,
    OCLImage2dArrayMSAADepthRO = 131,
    OCLImage3dRO = 132,
    OCLImage1dWO = 133,
    OCLImage1dArrayWO = 134,
    OCLImage1dBufferWO = 135,
    OCLImage2dWO = 136,
    OCLImage2dArrayWO = 137,
    OCLImage2dDepthWO = 138,
    OCLImage2dArrayDepthWO = 139,
    OCLImage2dMSAAWO = 140,
    OCLImage2dArrayMSAAWO = 141,
    OCLImage2dMSAADepthWO = 142,
    OCLImage2dArrayMSAADepthWO = 143,
    OCLImage3dWO = 144,
    OCLImage1dRW = 145,
    OCLImage1dArrayRW = 146,
    OCLImage1dBufferRW = 147,
    OCLImage2dRW = 148,
    OCLImage2dArrayRW = 149,
    OCLImage2dDepthRW = 150,
    OCLImage2dArrayDepthRW = 151,
    OCLImage2dMSAARW = 152,
    OCLImage2dArrayMSAARW = 153,
    OCLImage2dMSAADepthRW = 154,
    OCLImage2dArrayMSAADepthRW = 155,
    OCLImage3dRW = 156,
    OCLSampler = 157,
    OCLEvent = 158,
    OCLQueue = 159,
    OCLReserveID = 160,
    ObjCObject = 161,
    ObjCTypeParam = 162,
    Attributed = 163,
    OCLIntelSubgroupAVCMcePayload = 164,
    OCLIntelSubgroupAVCImePayload = 165,
    OCLIntelSubgroupAVCRefPayload = 166,
    OCLIntelSubgroupAVCSicPayload = 167,
    OCLIntelSubgroupAVCMceResult = 168,
    OCLIntelSubgroupAVCImeResult = 169,
    OCLIntelSubgroupAVCRefResult = 170,
    OCLIntelSubgroupAVCSicResult = 171,
    OCLIntelSubgroupAVCImeResultSingleRefStreamout = 172,
    OCLIntelSubgroupAVCImeResultDualRefStreamout = 173,
    OCLIntelSubgroupAVCImeSingleRefStreamin = 174,
    OCLIntelSubgroupAVCImeDualRefStreamin = 175,
    ExtVector = 176,
    Atomic = 177,
    BTFTagAttributed = 178,
}

/// CXCallingConv
CallingConv :: enum cffi.uint {
    Default = 0,
    C = 1,
    X86StdCall = 2,
    X86FastCall = 3,
    X86ThisCall = 4,
    X86Pascal = 5,
    AAPCS = 6,
    AAPCS_VFP = 7,
    X86RegCall = 8,
    IntelOclBicc = 9,
    Win64 = 10,
    X86_64Win64 = 10,
    X86_64SysV = 11,
    X86VectorCall = 12,
    Swift = 13,
    PreserveMost = 14,
    PreserveAll = 15,
    AArch64VectorCall = 16,
    SwiftAsync = 17,
    AArch64SVEPCS = 18,
    Invalid = 100,
    Unexposed = 200,
}

/// CXTemplateArgumentKind
TemplateArgumentKind :: enum cffi.uint {
    Null = 0,
    Type = 1,
    Declaration = 2,
    NullPtr = 3,
    Integral = 4,
    Template = 5,
    TemplateExpansion = 6,
    Expression = 7,
    Pack = 8,
    Invalid = 9,
}

/// CXTypeNullabilityKind
TypeNullabilityKind :: enum cffi.uint {
    NonNull = 0,
    Nullable = 1,
    Unspecified = 2,
    Invalid = 3,
    NullableResult = 4,
}

/// CXTypeLayoutError
TypeLayoutError :: enum cffi.int {
    Invalid = -1,
    Incomplete = -2,
    Dependent = -3,
    NotConstantSize = -4,
    InvalidFieldName = -5,
    Undeduced = -6,
}

/// CXRefQualifierKind
RefQualifierKind :: enum cffi.uint {
    None = 0,
    LValue = 1,
    RValue = 2,
}

/// CX_CXXAccessSpecifier
CXXAccessSpecifier :: enum cffi.uint {
    InvalidAccessSpecifier = 0,
    Public = 1,
    Protected = 2,
    Private = 3,
}

/// CX_StorageClass
StorageClass :: enum cffi.uint {
    Invalid = 0,
    None = 1,
    Extern = 2,
    Static = 3,
    PrivateExtern = 4,
    OpenCLWorkGroupLocal = 5,
    Auto = 6,
    Register = 7,
}

/// CXChildVisitResult
ChildVisitResult :: enum cffi.uint {
    Break = 0,
    Continue = 1,
    Recurse = 2,
}

/// CXPrintingPolicyProperty
PrintingPolicyProperty :: enum cffi.uint {
    Indentation = 0,
    SuppressSpecifiers = 1,
    SuppressTagKeyword = 2,
    IncludeTagDefinition = 3,
    SuppressScope = 4,
    SuppressUnwrittenScope = 5,
    SuppressInitializers = 6,
    ConstantArraySizeAsWritten = 7,
    AnonymousTagLocations = 8,
    SuppressStrongLifetime = 9,
    SuppressLifetimeQualifiers = 10,
    SuppressTemplateArgsInCXXConstructors = 11,
    Bool = 12,
    Restrict = 13,
    Alignof = 14,
    UnderscoreAlignof = 15,
    UseVoidForZeroParams = 16,
    TerseOutput = 17,
    PolishForDeclaration = 18,
    Half = 19,
    MSWChar = 20,
    IncludeNewlines = 21,
    MSVCFormatting = 22,
    ConstantsAsWritten = 23,
    SuppressImplicitBase = 24,
    FullyQualifiedName = 25,
    LastProperty = 25,
}

/// CXNameRefFlags
NameRefFlag :: enum cffi.uint {
    Qualifier = 0,
    TemplateArgs = 1,
    SinglePiece = 2,
}
NameRefFlags :: bit_set[NameRefFlag; cffi.uint]

/// CXCompletionChunkKind
CompletionChunkKind :: enum cffi.uint {
    Optional = 0,
    TypedText = 1,
    Text = 2,
    Placeholder = 3,
    Informative = 4,
    CurrentParameter = 5,
    LeftParen = 6,
    RightParen = 7,
    LeftBracket = 8,
    RightBracket = 9,
    LeftBrace = 10,
    RightBrace = 11,
    LeftAngle = 12,
    RightAngle = 13,
    Comma = 14,
    ResultType = 15,
    Colon = 16,
    SemiColon = 17,
    Equal = 18,
    HorizontalSpace = 19,
    VerticalSpace = 20,
}

/// CXCodeComplete_Flags
CodeComplete_Flag :: enum cffi.uint {
    IncludeMacros = 0,
    IncludeCodePatterns = 1,
    IncludeBriefComments = 2,
    SkipPreamble = 3,
    IncludeCompletionsWithFixIts = 4,
}
CodeComplete_Flags :: bit_set[CodeComplete_Flag; cffi.uint]

/// CXCompletionContext
CompletionContext :: enum cffi.uint {
    Unexposed = 0,
    AnyType = 1,
    AnyValue = 2,
    ObjCObjectValue = 4,
    ObjCSelectorValue = 8,
    CXXClassTypeValue = 16,
    DotMemberAccess = 32,
    ArrowMemberAccess = 64,
    ObjCPropertyAccess = 128,
    EnumTag = 256,
    UnionTag = 512,
    StructTag = 1024,
    ClassTag = 2048,
    Namespace = 4096,
    NestedNameSpecifier = 8192,
    ObjCInterface = 16384,
    ObjCProtocol = 32768,
    ObjCCategory = 65536,
    ObjCInstanceMessage = 131072,
    ObjCClassMessage = 262144,
    ObjCSelectorName = 524288,
    MacroName = 1048576,
    NaturalLanguage = 2097152,
    IncludedFile = 4194304,
    Unknown = 8388607,
}

/// CXVisitorResult
VisitorResult :: enum cffi.uint {
    Break = 0,
    Continue = 1,
}

/// CXCommentKind
CommentKind :: enum cffi.uint {
    Null = 0,
    Text = 1,
    InlineCommand = 2,
    HTMLStartTag = 3,
    HTMLEndTag = 4,
    Paragraph = 5,
    BlockCommand = 6,
    ParamCommand = 7,
    TParamCommand = 8,
    VerbatimBlockCommand = 9,
    VerbatimBlockLine = 10,
    VerbatimLine = 11,
    FullComment = 12,
}

/// CXCommentInlineCommandRenderKind
CommentInlineCommandRenderKind :: enum cffi.uint {
    Normal = 0,
    Bold = 1,
    Monospaced = 2,
    Emphasized = 3,
    Anchor = 4,
}

/// CXCommentParamPassDirection
CommentParamPassDirection :: enum cffi.uint {
    In = 0,
    Out = 1,
    InOut = 2,
}

/// CXString
String :: struct #align (8) {
    data: rawptr,
    private_flags: cffi.uint,
}
#assert(size_of(String) == 16)

/// CXStringSet
StringSet :: struct #align (8) {
    Strings: ^String,
    Count: cffi.uint,
}
#assert(size_of(StringSet) == 16)

/// CXVirtualFileOverlayImpl
VirtualFileOverlayImpl :: struct {}

/// CXModuleMapDescriptorImpl
ModuleMapDescriptorImpl :: struct {}

/// CXFileUniqueID
FileUniqueID :: struct #align (8) {
    data: [3]cffi.ulonglong,
}
#assert(size_of(FileUniqueID) == 24)

/// CXSourceLocation
SourceLocation :: struct #align (8) {
    ptr_data: [2]rawptr,
    int_data: cffi.uint,
}
#assert(size_of(SourceLocation) == 24)

/// CXSourceRange
SourceRange :: struct #align (8) {
    ptr_data: [2]rawptr,
    begin_int_data: cffi.uint,
    end_int_data: cffi.uint,
}
#assert(size_of(SourceRange) == 24)

/// CXSourceRangeList
SourceRangeList :: struct #align (8) {
    count: cffi.uint,
    ranges: ^SourceRange,
}
#assert(size_of(SourceRangeList) == 16)

/// CXTargetInfoImpl
TargetInfoImpl :: struct {}

/// CXTranslationUnitImpl
TranslationUnitImpl :: struct {}

/// CXUnsavedFile
UnsavedFile :: struct #align (8) {
    Filename: cstring,
    Contents: cstring,
    Length: cffi.ulong,
}
#assert(size_of(UnsavedFile) == 24)

/// CXVersion
Version :: struct #align (4) {
    Major: cffi.int,
    Minor: cffi.int,
    Subminor: cffi.int,
}
#assert(size_of(Version) == 12)

/// CXTUResourceUsageEntry
TUResourceUsageEntry :: struct #align (8) {
    kind: TUResourceUsageKind,
    amount: cffi.ulong,
}
#assert(size_of(TUResourceUsageEntry) == 16)

/// CXTUResourceUsage
TUResourceUsage :: struct #align (8) {
    data: rawptr,
    numEntries: cffi.uint,
    entries: ^TUResourceUsageEntry,
}
#assert(size_of(TUResourceUsage) == 24)

/// CXCursor
Cursor :: struct #align (8) {
    kind: CursorKind,
    xdata: cffi.int,
    data: [3]rawptr,
}
#assert(size_of(Cursor) == 32)

/// CXPlatformAvailability
PlatformAvailability :: struct #align (8) {
    Platform: String,
    Introduced: Version,
    Deprecated: Version,
    Obsoleted: Version,
    Unavailable: cffi.int,
    Message: String,
}
#assert(size_of(PlatformAvailability) == 72)

/// CXCursorSetImpl
CursorSetImpl :: struct {}

/// CXType
Type :: struct #align (8) {
    kind: TypeKind,
    data: [2]rawptr,
}
#assert(size_of(Type) == 24)

/// CXToken
Token :: struct #align (8) {
    int_data: [4]cffi.uint,
    ptr_data: rawptr,
}
#assert(size_of(Token) == 24)

/// CXCompletionResult
CompletionResult :: struct #align (8) {
    CursorKind: CursorKind,
    CompletionString: CompletionString,
}
#assert(size_of(CompletionResult) == 16)

/// CXCodeCompleteResults
CodeCompleteResults :: struct #align (8) {
    Results: ^CompletionResult,
    NumResults: cffi.uint,
}
#assert(size_of(CodeCompleteResults) == 16)

/// CXCursorAndRangeVisitor
CursorAndRangeVisitor :: struct #align (8) {
    _context: rawptr,
    visit: proc "c" (_context: rawptr, _arg_0: Cursor, _arg_1: SourceRange) -> VisitorResult,
}
#assert(size_of(CursorAndRangeVisitor) == 16)

/// CXIdxLoc
IdxLoc :: struct #align (8) {
    ptr_data: [2]rawptr,
    int_data: cffi.uint,
}
#assert(size_of(IdxLoc) == 24)

/// CXIdxIncludedFileInfo
IdxIncludedFileInfo :: struct #align (8) {
    hashLoc: IdxLoc,
    filename: cstring,
    file: File,
    isImport: cffi.int,
    isAngled: cffi.int,
    isModuleImport: cffi.int,
}
#assert(size_of(IdxIncludedFileInfo) == 56)

/// CXIdxImportedASTFileInfo
IdxImportedASTFileInfo :: struct #align (8) {
    file: File,
    module: Module,
    loc: IdxLoc,
    isImplicit: cffi.int,
}
#assert(size_of(IdxImportedASTFileInfo) == 48)

/// CXIdxAttrInfo
IdxAttrInfo :: struct #align (8) {
    kind: IdxAttrKind,
    cursor: Cursor,
    loc: IdxLoc,
}
#assert(size_of(IdxAttrInfo) == 64)

/// CXIdxEntityInfo
IdxEntityInfo :: struct #align (8) {
    kind: IdxEntityKind,
    templateKind: IdxEntityCXXTemplateKind,
    lang: IdxEntityLanguage,
    name: cstring,
    USR: cstring,
    cursor: Cursor,
    attributes: ^^IdxAttrInfo,
    numAttributes: cffi.uint,
}
#assert(size_of(IdxEntityInfo) == 80)

/// CXIdxContainerInfo
IdxContainerInfo :: struct #align (8) {
    cursor: Cursor,
}
#assert(size_of(IdxContainerInfo) == 32)

/// CXIdxIBOutletCollectionAttrInfo
IdxIBOutletCollectionAttrInfo :: struct #align (8) {
    attrInfo: ^IdxAttrInfo,
    objcClass: ^IdxEntityInfo,
    classCursor: Cursor,
    classLoc: IdxLoc,
}
#assert(size_of(IdxIBOutletCollectionAttrInfo) == 72)

/// CXIdxDeclInfo
IdxDeclInfo :: struct #align (8) {
    entityInfo: ^IdxEntityInfo,
    cursor: Cursor,
    loc: IdxLoc,
    semanticContainer: ^IdxContainerInfo,
    lexicalContainer: ^IdxContainerInfo,
    isRedeclaration: cffi.int,
    isDefinition: cffi.int,
    isContainer: cffi.int,
    declAsContainer: ^IdxContainerInfo,
    isImplicit: cffi.int,
    attributes: ^^IdxAttrInfo,
    numAttributes: cffi.uint,
    flags: cffi.uint,
}
#assert(size_of(IdxDeclInfo) == 128)

/// CXIdxObjCContainerDeclInfo
IdxObjCContainerDeclInfo :: struct #align (8) {
    declInfo: ^IdxDeclInfo,
    kind: IdxObjCContainerKind,
}
#assert(size_of(IdxObjCContainerDeclInfo) == 16)

/// CXIdxBaseClassInfo
IdxBaseClassInfo :: struct #align (8) {
    base: ^IdxEntityInfo,
    cursor: Cursor,
    loc: IdxLoc,
}
#assert(size_of(IdxBaseClassInfo) == 64)

/// CXIdxObjCProtocolRefInfo
IdxObjCProtocolRefInfo :: struct #align (8) {
    protocol: ^IdxEntityInfo,
    cursor: Cursor,
    loc: IdxLoc,
}
#assert(size_of(IdxObjCProtocolRefInfo) == 64)

/// CXIdxObjCProtocolRefListInfo
IdxObjCProtocolRefListInfo :: struct #align (8) {
    protocols: ^^IdxObjCProtocolRefInfo,
    numProtocols: cffi.uint,
}
#assert(size_of(IdxObjCProtocolRefListInfo) == 16)

/// CXIdxObjCInterfaceDeclInfo
IdxObjCInterfaceDeclInfo :: struct #align (8) {
    containerInfo: ^IdxObjCContainerDeclInfo,
    superInfo: ^IdxBaseClassInfo,
    protocols: ^IdxObjCProtocolRefListInfo,
}
#assert(size_of(IdxObjCInterfaceDeclInfo) == 24)

/// CXIdxObjCCategoryDeclInfo
IdxObjCCategoryDeclInfo :: struct #align (8) {
    containerInfo: ^IdxObjCContainerDeclInfo,
    objcClass: ^IdxEntityInfo,
    classCursor: Cursor,
    classLoc: IdxLoc,
    protocols: ^IdxObjCProtocolRefListInfo,
}
#assert(size_of(IdxObjCCategoryDeclInfo) == 80)

/// CXIdxObjCPropertyDeclInfo
IdxObjCPropertyDeclInfo :: struct #align (8) {
    declInfo: ^IdxDeclInfo,
    getter: ^IdxEntityInfo,
    setter: ^IdxEntityInfo,
}
#assert(size_of(IdxObjCPropertyDeclInfo) == 24)

/// CXIdxCXXClassDeclInfo
IdxCXXClassDeclInfo :: struct #align (8) {
    declInfo: ^IdxDeclInfo,
    bases: ^^IdxBaseClassInfo,
    numBases: cffi.uint,
}
#assert(size_of(IdxCXXClassDeclInfo) == 24)

/// CXIdxEntityRefInfo
IdxEntityRefInfo :: struct #align (8) {
    kind: IdxEntityRefKind,
    cursor: Cursor,
    loc: IdxLoc,
    referencedEntity: ^IdxEntityInfo,
    parentEntity: ^IdxEntityInfo,
    container: ^IdxContainerInfo,
    role: SymbolRole,
}
#assert(size_of(IdxEntityRefInfo) == 96)

/// IndexerCallbacks
IndexerCallbacks :: struct #align (8) {
    abortQuery: proc "c" (client_data: ClientData, reserved: rawptr) -> cffi.int,
    diagnostic: proc "c" (client_data: ClientData, _arg_0: DiagnosticSet, reserved: rawptr),
    enteredMainFile: proc "c" (client_data: ClientData, mainFile: File, reserved: rawptr) -> IdxClientFile,
    ppIncludedFile: proc "c" (client_data: ClientData, _arg_0: ^IdxIncludedFileInfo) -> IdxClientFile,
    importedASTFile: proc "c" (client_data: ClientData, _arg_0: ^IdxImportedASTFileInfo) -> IdxClientASTFile,
    startedTranslationUnit: proc "c" (client_data: ClientData, reserved: rawptr) -> IdxClientContainer,
    indexDeclaration: proc "c" (client_data: ClientData, _arg_0: ^IdxDeclInfo),
    indexEntityReference: proc "c" (client_data: ClientData, _arg_0: ^IdxEntityRefInfo),
}
#assert(size_of(IndexerCallbacks) == 64)

/// CXComment
Comment :: struct #align (8) {
    ASTNode: rawptr,
    TranslationUnit: TranslationUnit,
}
#assert(size_of(Comment) == 16)

/// CXAPISetImpl
APISetImpl :: struct {}

