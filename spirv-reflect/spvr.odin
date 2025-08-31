package spvr

import "base:intrinsics"
import "base:runtime"
import cffi "core:c"


when ODIN_OS != .Windows && ODIN_OS != .Darwin && ODIN_OS != .Linux do #panic("Unsupported OS.")

@(private) LIB_NAME   :: "spirv-reflect-static"
@(private) LIB_PREFIX :: "lib" when ODIN_OS != .Windows else ""
@(private) LIB_EXT    :: "a" when ODIN_OS != .Windows else "lib"
@(private) LIB_CONFIG :: "debug" when ODIN_DEBUG else "release"
@(private) LIB_OS     :: "macos" when ODIN_OS == .Darwin else "linux" when ODIN_OS == .Linux else "windows"

@(private) LIB        :: "./libs/" + LIB_CONFIG + "/" + LIB_OS + "/" + LIB_PREFIX + LIB_NAME + "." + LIB_EXT

foreign import lib_spvr { LIB }

ModuleFlags     :: ModuleFlagBits
TypeFlags       :: TypeFlagBits
DecorationFlags :: DecorationFlagBits
VariableFlags   :: VariableFlagBits



@(default_calling_convention="c")
foreign lib_spvr {
    @(link_name="spvReflectCreateShaderModule")
    CreateShaderModule :: proc(size: cffi.size_t, p_code: rawptr, p_module: ^ShaderModule) -> Result ---

    @(link_name="spvReflectCreateShaderModule2")
    CreateShaderModule2 :: proc(flags: ModuleFlags, size: cffi.size_t, p_code: rawptr, p_module: ^ShaderModule) -> Result ---

    @(link_name="spvReflectGetShaderModule")
    GetShaderModule :: proc(size: cffi.size_t, p_code: rawptr, p_module: ^ShaderModule) -> Result ---

    @(link_name="spvReflectDestroyShaderModule")
    DestroyShaderModule :: proc(p_module: ^ShaderModule) ---

    @(link_name="spvReflectGetCodeSize")
    GetCodeSize :: proc(p_module: ^ShaderModule) -> cffi.uint32_t ---

    @(link_name="spvReflectGetCode")
    GetCode :: proc(p_module: ^ShaderModule) -> ^cffi.uint32_t ---

    @(link_name="spvReflectGetEntryPoint")
    GetEntryPoint :: proc(p_module: ^ShaderModule, entry_point: cstring) -> ^EntryPoint ---

    @(link_name="spvReflectEnumerateDescriptorBindings")
    EnumerateDescriptorBindings :: proc(p_module: ^ShaderModule, p_count: ^cffi.uint32_t, pp_bindings: ^^DescriptorBinding) -> Result ---

    @(link_name="spvReflectEnumerateEntryPointDescriptorBindings")
    EnumerateEntryPointDescriptorBindings :: proc(p_module: ^ShaderModule, entry_point: cstring, p_count: ^cffi.uint32_t, pp_bindings: ^^DescriptorBinding) -> Result ---

    @(link_name="spvReflectEnumerateDescriptorSets")
    EnumerateDescriptorSets :: proc(p_module: ^ShaderModule, p_count: ^cffi.uint32_t, pp_sets: ^^DescriptorSet) -> Result ---

    @(link_name="spvReflectEnumerateEntryPointDescriptorSets")
    EnumerateEntryPointDescriptorSets :: proc(p_module: ^ShaderModule, entry_point: cstring, p_count: ^cffi.uint32_t, pp_sets: ^^DescriptorSet) -> Result ---

    @(link_name="spvReflectEnumerateInterfaceVariables")
    EnumerateInterfaceVariables :: proc(p_module: ^ShaderModule, p_count: ^cffi.uint32_t, pp_variables: ^^InterfaceVariable) -> Result ---

    @(link_name="spvReflectEnumerateEntryPointInterfaceVariables")
    EnumerateEntryPointInterfaceVariables :: proc(p_module: ^ShaderModule, entry_point: cstring, p_count: ^cffi.uint32_t, pp_variables: ^^InterfaceVariable) -> Result ---

    @(link_name="spvReflectEnumerateInputVariables")
    EnumerateInputVariables :: proc(p_module: ^ShaderModule, p_count: ^cffi.uint32_t, pp_variables: ^^InterfaceVariable) -> Result ---

    @(link_name="spvReflectEnumerateEntryPointInputVariables")
    EnumerateEntryPointInputVariables :: proc(p_module: ^ShaderModule, entry_point: cstring, p_count: ^cffi.uint32_t, pp_variables: ^^InterfaceVariable) -> Result ---

    @(link_name="spvReflectEnumerateOutputVariables")
    EnumerateOutputVariables :: proc(p_module: ^ShaderModule, p_count: ^cffi.uint32_t, pp_variables: ^^InterfaceVariable) -> Result ---

    @(link_name="spvReflectEnumerateEntryPointOutputVariables")
    EnumerateEntryPointOutputVariables :: proc(p_module: ^ShaderModule, entry_point: cstring, p_count: ^cffi.uint32_t, pp_variables: ^^InterfaceVariable) -> Result ---

    @(link_name="spvReflectEnumeratePushConstantBlocks")
    EnumeratePushConstantBlocks :: proc(p_module: ^ShaderModule, p_count: ^cffi.uint32_t, pp_blocks: ^^BlockVariable) -> Result ---

    @(link_name="spvReflectEnumeratePushConstants")
    EnumeratePushConstants :: proc(p_module: ^ShaderModule, p_count: ^cffi.uint32_t, pp_blocks: ^^BlockVariable) -> Result ---

    @(link_name="spvReflectEnumerateEntryPointPushConstantBlocks")
    EnumerateEntryPointPushConstantBlocks :: proc(p_module: ^ShaderModule, entry_point: cstring, p_count: ^cffi.uint32_t, pp_blocks: ^^BlockVariable) -> Result ---

    @(link_name="spvReflectEnumerateSpecializationConstants")
    EnumerateSpecializationConstants :: proc(p_module: ^ShaderModule, p_count: ^cffi.uint32_t, pp_constants: ^^SpecializationConstant) -> Result ---

    @(link_name="spvReflectGetDescriptorBinding")
    GetDescriptorBinding :: proc(p_module: ^ShaderModule, binding_number: cffi.uint32_t, set_number: cffi.uint32_t, p_result: ^Result) -> ^DescriptorBinding ---

    @(link_name="spvReflectGetEntryPointDescriptorBinding")
    GetEntryPointDescriptorBinding :: proc(p_module: ^ShaderModule, entry_point: cstring, binding_number: cffi.uint32_t, set_number: cffi.uint32_t, p_result: ^Result) -> ^DescriptorBinding ---

    @(link_name="spvReflectGetDescriptorSet")
    GetDescriptorSet :: proc(p_module: ^ShaderModule, set_number: cffi.uint32_t, p_result: ^Result) -> ^DescriptorSet ---

    @(link_name="spvReflectGetEntryPointDescriptorSet")
    GetEntryPointDescriptorSet :: proc(p_module: ^ShaderModule, entry_point: cstring, set_number: cffi.uint32_t, p_result: ^Result) -> ^DescriptorSet ---

    @(link_name="spvReflectGetInputVariableByLocation")
    GetInputVariableByLocation :: proc(p_module: ^ShaderModule, location: cffi.uint32_t, p_result: ^Result) -> ^InterfaceVariable ---

    @(link_name="spvReflectGetInputVariable")
    GetInputVariable :: proc(p_module: ^ShaderModule, location: cffi.uint32_t, p_result: ^Result) -> ^InterfaceVariable ---

    @(link_name="spvReflectGetEntryPointInputVariableByLocation")
    GetEntryPointInputVariableByLocation :: proc(p_module: ^ShaderModule, entry_point: cstring, location: cffi.uint32_t, p_result: ^Result) -> ^InterfaceVariable ---

    @(link_name="spvReflectGetInputVariableBySemantic")
    GetInputVariableBySemantic :: proc(p_module: ^ShaderModule, semantic: cstring, p_result: ^Result) -> ^InterfaceVariable ---

    @(link_name="spvReflectGetEntryPointInputVariableBySemantic")
    GetEntryPointInputVariableBySemantic :: proc(p_module: ^ShaderModule, entry_point: cstring, semantic: cstring, p_result: ^Result) -> ^InterfaceVariable ---

    @(link_name="spvReflectGetOutputVariableByLocation")
    GetOutputVariableByLocation :: proc(p_module: ^ShaderModule, location: cffi.uint32_t, p_result: ^Result) -> ^InterfaceVariable ---

    @(link_name="spvReflectGetOutputVariable")
    GetOutputVariable :: proc(p_module: ^ShaderModule, location: cffi.uint32_t, p_result: ^Result) -> ^InterfaceVariable ---

    @(link_name="spvReflectGetEntryPointOutputVariableByLocation")
    GetEntryPointOutputVariableByLocation :: proc(p_module: ^ShaderModule, entry_point: cstring, location: cffi.uint32_t, p_result: ^Result) -> ^InterfaceVariable ---

    @(link_name="spvReflectGetOutputVariableBySemantic")
    GetOutputVariableBySemantic :: proc(p_module: ^ShaderModule, semantic: cstring, p_result: ^Result) -> ^InterfaceVariable ---

    @(link_name="spvReflectGetEntryPointOutputVariableBySemantic")
    GetEntryPointOutputVariableBySemantic :: proc(p_module: ^ShaderModule, entry_point: cstring, semantic: cstring, p_result: ^Result) -> ^InterfaceVariable ---

    @(link_name="spvReflectGetPushConstantBlock")
    GetPushConstantBlock :: proc(p_module: ^ShaderModule, index: cffi.uint32_t, p_result: ^Result) -> ^BlockVariable ---

    @(link_name="spvReflectGetPushConstant")
    GetPushConstant :: proc(p_module: ^ShaderModule, index: cffi.uint32_t, p_result: ^Result) -> ^BlockVariable ---

    @(link_name="spvReflectGetEntryPointPushConstantBlock")
    GetEntryPointPushConstantBlock :: proc(p_module: ^ShaderModule, entry_point: cstring, p_result: ^Result) -> ^BlockVariable ---

    @(link_name="spvReflectChangeDescriptorBindingNumbers")
    ChangeDescriptorBindingNumbers :: proc(p_module: ^ShaderModule, p_binding: ^DescriptorBinding, new_binding_number: cffi.uint32_t, new_set_number: cffi.uint32_t) -> Result ---

    @(link_name="spvReflectChangeDescriptorBindingNumber")
    ChangeDescriptorBindingNumber :: proc(p_module: ^ShaderModule, p_descriptor_binding: ^DescriptorBinding, new_binding_number: cffi.uint32_t, optional_new_set_number: cffi.uint32_t) -> Result ---

    @(link_name="spvReflectChangeDescriptorSetNumber")
    ChangeDescriptorSetNumber :: proc(p_module: ^ShaderModule, p_set: ^DescriptorSet, new_set_number: cffi.uint32_t) -> Result ---

    @(link_name="spvReflectChangeInputVariableLocation")
    ChangeInputVariableLocation :: proc(p_module: ^ShaderModule, p_input_variable: ^InterfaceVariable, new_location: cffi.uint32_t) -> Result ---

    @(link_name="spvReflectChangeOutputVariableLocation")
    ChangeOutputVariableLocation :: proc(p_module: ^ShaderModule, p_output_variable: ^InterfaceVariable, new_location: cffi.uint32_t) -> Result ---

    @(link_name="spvReflectSourceLanguage")
    SourceLanguage :: proc(source_lang: SpvSourceLanguage) -> cstring ---

    @(link_name="spvReflectBlockVariableTypeName")
    BlockVariableTypeName :: proc(p_var: ^BlockVariable) -> cstring ---

}

/// SpvId
SpvId :: cffi.uint

/// SpvSourceLanguage
SpvSourceLanguage :: enum cffi.uint {
    Unknown        = 0,
    ESSL           = 1,
    GLSL           = 2,
    OpenCL_C       = 3,
    OpenCL_CPP     = 4,
    HLSL           = 5,
    CPP_for_OpenCL = 6,
    SYCL           = 7,
    HERO_C         = 8,
    NZSL           = 9,
    Max            = 2147483647,
}

/// SpvExecutionModel
SpvExecutionModel :: enum cffi.uint {
    Vertex                 = 0,
    TessellationControl    = 1,
    TessellationEvaluation = 2,
    Geometry               = 3,
    Fragment               = 4,
    GLCompute              = 5,
    Kernel                 = 6,
    TaskNV                 = 5267,
    MeshNV                 = 5268,
    RayGenerationKHR       = 5313,
    RayGenerationNV        = 5313,
    IntersectionKHR        = 5314,
    IntersectionNV         = 5314,
    AnyHitKHR              = 5315,
    AnyHitNV               = 5315,
    ClosestHitKHR          = 5316,
    ClosestHitNV           = 5316,
    MissKHR                = 5317,
    MissNV                 = 5317,
    CallableKHR            = 5318,
    CallableNV             = 5318,
    TaskEXT                = 5364,
    MeshEXT                = 5365,
    Max                    = 2147483647,
}

/// SpvAddressingModel
SpvAddressingModel :: enum cffi.uint {
    Logical                    = 0,
    Physical32                 = 1,
    Physical64                 = 2,
    PhysicalStorageBuffer64    = 5348,
    PhysicalStorageBuffer64EXT = 5348,
    Max                        = 2147483647,
}

/// SpvMemoryModel
SpvMemoryModel :: enum cffi.uint {
    Simple    = 0,
    GLSL450   = 1,
    OpenCL    = 2,
    Vulkan    = 3,
    VulkanKHR = 3,
    Max       = 2147483647,
}

/// SpvExecutionMode
SpvExecutionMode :: enum cffi.uint {
    Invocations                      = 0,
    SpacingEqual                     = 1,
    SpacingFractionalEven            = 2,
    SpacingFractionalOdd             = 3,
    VertexOrderCw                    = 4,
    VertexOrderCcw                   = 5,
    PixelCenterInteger               = 6,
    OriginUpperLeft                  = 7,
    OriginLowerLeft                  = 8,
    EarlyFragmentTests               = 9,
    PointMode                        = 10,
    Xfb                              = 11,
    DepthReplacing                   = 12,
    DepthGreater                     = 14,
    DepthLess                        = 15,
    DepthUnchanged                   = 16,
    LocalSize                        = 17,
    LocalSizeHint                    = 18,
    InputPoints                      = 19,
    InputLines                       = 20,
    InputLinesAdjacency              = 21,
    Triangles                        = 22,
    InputTrianglesAdjacency          = 23,
    Quads                            = 24,
    Isolines                         = 25,
    OutputVertices                   = 26,
    OutputPoints                     = 27,
    OutputLineStrip                  = 28,
    OutputTriangleStrip              = 29,
    VecTypeHint                      = 30,
    ContractionOff                   = 31,
    Initializer                      = 33,
    Finalizer                        = 34,
    SubgroupSize                     = 35,
    SubgroupsPerWorkgroup            = 36,
    SubgroupsPerWorkgroupId          = 37,
    LocalSizeId                      = 38,
    LocalSizeHintId                  = 39,
    NonCoherentColorAttachmentReadEXT = 4169,
    NonCoherentDepthAttachmentReadEXT = 4170,
    NonCoherentStencilAttachmentReadEXT = 4171,
    SubgroupUniformControlFlowKHR    = 4421,
    PostDepthCoverage                = 4446,
    DenormPreserve                   = 4459,
    DenormFlushToZero                = 4460,
    SignedZeroInfNanPreserve         = 4461,
    RoundingModeRTE                  = 4462,
    RoundingModeRTZ                  = 4463,
    EarlyAndLateFragmentTestsAMD     = 5017,
    StencilRefReplacingEXT           = 5027,
    StencilRefUnchangedFrontAMD      = 5079,
    StencilRefGreaterFrontAMD        = 5080,
    StencilRefLessFrontAMD           = 5081,
    StencilRefUnchangedBackAMD       = 5082,
    StencilRefGreaterBackAMD         = 5083,
    StencilRefLessBackAMD            = 5084,
    OutputLinesEXT                   = 5269,
    OutputLinesNV                    = 5269,
    OutputPrimitivesEXT              = 5270,
    OutputPrimitivesNV               = 5270,
    DerivativeGroupQuadsNV           = 5289,
    DerivativeGroupLinearNV          = 5290,
    OutputTrianglesEXT               = 5298,
    OutputTrianglesNV                = 5298,
    PixelInterlockOrderedEXT         = 5366,
    PixelInterlockUnorderedEXT       = 5367,
    SampleInterlockOrderedEXT        = 5368,
    SampleInterlockUnorderedEXT      = 5369,
    ShadingRateInterlockOrderedEXT   = 5370,
    ShadingRateInterlockUnorderedEXT = 5371,
    SharedLocalMemorySizeINTEL       = 5618,
    RoundingModeRTPINTEL             = 5620,
    RoundingModeRTNINTEL             = 5621,
    FloatingPointModeALTINTEL        = 5622,
    FloatingPointModeIEEEINTEL       = 5623,
    MaxWorkgroupSizeINTEL            = 5893,
    MaxWorkDimINTEL                  = 5894,
    NoGlobalOffsetINTEL              = 5895,
    NumSIMDWorkitemsINTEL            = 5896,
    SchedulerTargetFmaxMhzINTEL      = 5903,
    StreamingInterfaceINTEL          = 6154,
    RegisterMapInterfaceINTEL        = 6160,
    NamedBarrierCountINTEL           = 6417,
    Max                              = 2147483647,
}

/// SpvStorageClass
SpvStorageClass :: enum cffi.uint {
    UniformConstant          = 0,
    Input                    = 1,
    Uniform                  = 2,
    Output                   = 3,
    Workgroup                = 4,
    CrossWorkgroup           = 5,
    Private                  = 6,
    Function                 = 7,
    Generic                  = 8,
    PushConstant             = 9,
    AtomicCounter            = 10,
    Image                    = 11,
    StorageBuffer            = 12,
    TileImageEXT             = 4172,
    CallableDataKHR          = 5328,
    CallableDataNV           = 5328,
    IncomingCallableDataKHR  = 5329,
    IncomingCallableDataNV   = 5329,
    RayPayloadKHR            = 5338,
    RayPayloadNV             = 5338,
    HitAttributeKHR          = 5339,
    HitAttributeNV           = 5339,
    IncomingRayPayloadKHR    = 5342,
    IncomingRayPayloadNV     = 5342,
    ShaderRecordBufferKHR    = 5343,
    ShaderRecordBufferNV     = 5343,
    PhysicalStorageBuffer    = 5349,
    PhysicalStorageBufferEXT = 5349,
    HitObjectAttributeNV     = 5385,
    TaskPayloadWorkgroupEXT  = 5402,
    CodeSectionINTEL         = 5605,
    DeviceOnlyINTEL          = 5936,
    HostOnlyINTEL            = 5937,
    Max                      = 2147483647,
}

/// SpvDim
SpvDim :: enum cffi.uint {
    _1D              = 0,
    _2D              = 1,
    _3D              = 2,
    Cube             = 3,
    Rect             = 4,
    Buffer           = 5,
    SubpassData      = 6,
    TileImageDataEXT = 4173,
    Max              = 2147483647,
}

/// SpvSamplerAddressingMode
SpvSamplerAddressingMode :: enum cffi.uint {
    None           = 0,
    ClampToEdge    = 1,
    Clamp          = 2,
    Repeat         = 3,
    RepeatMirrored = 4,
    Max            = 2147483647,
}

/// SpvSamplerFilterMode
SpvSamplerFilterMode :: enum cffi.uint {
    Nearest = 0,
    Linear  = 1,
    Max     = 2147483647,
}

/// SpvImageFormat
SpvImageFormat :: enum cffi.uint {
    Unknown      = 0,
    Rgba32f      = 1,
    Rgba16f      = 2,
    R32f         = 3,
    Rgba8        = 4,
    Rgba8Snorm   = 5,
    Rg32f        = 6,
    Rg16f        = 7,
    R11fG11fB10f = 8,
    R16f         = 9,
    Rgba16       = 10,
    Rgb10A2      = 11,
    Rg16         = 12,
    Rg8          = 13,
    R16          = 14,
    R8           = 15,
    Rgba16Snorm  = 16,
    Rg16Snorm    = 17,
    Rg8Snorm     = 18,
    R16Snorm     = 19,
    R8Snorm      = 20,
    Rgba32i      = 21,
    Rgba16i      = 22,
    Rgba8i       = 23,
    R32i         = 24,
    Rg32i        = 25,
    Rg16i        = 26,
    Rg8i         = 27,
    R16i         = 28,
    R8i          = 29,
    Rgba32ui     = 30,
    Rgba16ui     = 31,
    Rgba8ui      = 32,
    R32ui        = 33,
    Rgb10a2ui    = 34,
    Rg32ui       = 35,
    Rg16ui       = 36,
    Rg8ui        = 37,
    R16ui        = 38,
    R8ui         = 39,
    R64ui        = 40,
    R64i         = 41,
    Max          = 2147483647,
}

/// SpvImageChannelOrder
SpvImageChannelOrder :: enum cffi.uint {
    R            = 0,
    A            = 1,
    RG           = 2,
    RA           = 3,
    RGB          = 4,
    RGBA         = 5,
    BGRA         = 6,
    ARGB         = 7,
    Intensity    = 8,
    Luminance    = 9,
    Rx           = 10,
    RGx          = 11,
    RGBx         = 12,
    Depth        = 13,
    DepthStencil = 14,
    sRGB         = 15,
    sRGBx        = 16,
    sRGBA        = 17,
    sBGRA        = 18,
    ABGR         = 19,
    Max          = 2147483647,
}

/// SpvImageChannelDataType
SpvImageChannelDataType :: enum cffi.uint {
    SnormInt8           = 0,
    SnormInt16          = 1,
    UnormInt8           = 2,
    UnormInt16          = 3,
    UnormShort565       = 4,
    UnormShort555       = 5,
    UnormInt101010      = 6,
    SignedInt8          = 7,
    SignedInt16         = 8,
    SignedInt32         = 9,
    UnsignedInt8        = 10,
    UnsignedInt16       = 11,
    UnsignedInt32       = 12,
    HalfFloat           = 13,
    Float               = 14,
    UnormInt24          = 15,
    UnormInt101010_2    = 16,
    UnsignedIntRaw10EXT = 19,
    UnsignedIntRaw12EXT = 20,
    Max                 = 2147483647,
}

/// SpvImageOperandsShift
SpvImageOperandsShift :: enum cffi.uint {
    BiasShift                  = 0,
    LodShift                   = 1,
    GradShift                  = 2,
    ConstOffsetShift           = 3,
    OffsetShift                = 4,
    ConstOffsetsShift          = 5,
    SampleShift                = 6,
    MinLodShift                = 7,
    MakeTexelAvailableShift    = 8,
    MakeTexelAvailableKHRShift = 8,
    MakeTexelVisibleShift      = 9,
    MakeTexelVisibleKHRShift   = 9,
    NonPrivateTexelShift       = 10,
    NonPrivateTexelKHRShift    = 10,
    VolatileTexelShift         = 11,
    VolatileTexelKHRShift      = 11,
    SignExtendShift            = 12,
    ZeroExtendShift            = 13,
    NontemporalShift           = 14,
    OffsetsShift               = 16,
    Max                        = 2147483647,
}

/// SpvImageOperandsMask
SpvImageOperandsFlag :: enum cffi.uint {
    BiasMask                  = 0,
    LodMask                   = 1,
    GradMask                  = 2,
    ConstOffsetMask           = 3,
    OffsetMask                = 4,
    ConstOffsetsMask          = 5,
    SampleMask                = 6,
    MinLodMask                = 7,
    MakeTexelAvailableMask    = 8,
    MakeTexelAvailableKHRMask = 8,
    MakeTexelVisibleMask      = 9,
    MakeTexelVisibleKHRMask   = 9,
    NonPrivateTexelMask       = 10,
    NonPrivateTexelKHRMask    = 10,
    VolatileTexelMask         = 11,
    VolatileTexelKHRMask      = 11,
    SignExtendMask            = 12,
    ZeroExtendMask            = 13,
    NontemporalMask           = 14,
    OffsetsMask               = 16,
}
SpvImageOperandsMask :: bit_set[SpvImageOperandsFlag; cffi.uint]

/// SpvFPFastMathModeShift
SpvFPFastMathModeShift :: enum cffi.uint {
    NotNaNShift                 = 0,
    NotInfShift                 = 1,
    NSZShift                    = 2,
    AllowRecipShift             = 3,
    FastShift                   = 4,
    AllowContractFastINTELShift = 16,
    AllowReassocINTELShift      = 17,
    Max                         = 2147483647,
}

/// SpvFPFastMathModeMask
SpvFPFastMathModeFlag :: enum cffi.uint {
    NotNaNMask                 = 0,
    NotInfMask                 = 1,
    NSZMask                    = 2,
    AllowRecipMask             = 3,
    FastMask                   = 4,
    AllowContractFastINTELMask = 16,
    AllowReassocINTELMask      = 17,
}
SpvFPFastMathModeMask :: bit_set[SpvFPFastMathModeFlag; cffi.uint]

/// SpvFPRoundingMode
SpvFPRoundingMode :: enum cffi.uint {
    RTE = 0,
    RTZ = 1,
    RTP = 2,
    RTN = 3,
    Max = 2147483647,
}

/// SpvLinkageType
SpvLinkageType :: enum cffi.uint {
    Export      = 0,
    Import      = 1,
    LinkOnceODR = 2,
    Max         = 2147483647,
}

/// SpvAccessQualifier
SpvAccessQualifier :: enum cffi.uint {
    ReadOnly  = 0,
    WriteOnly = 1,
    ReadWrite = 2,
    Max       = 2147483647,
}

/// SpvFunctionParameterAttribute
SpvFunctionParameterAttribute :: enum cffi.uint {
    Zext                = 0,
    Sext                = 1,
    ByVal               = 2,
    Sret                = 3,
    NoAlias             = 4,
    NoCapture           = 5,
    NoWrite             = 6,
    NoReadWrite         = 7,
    RuntimeAlignedINTEL = 5940,
    Max                 = 2147483647,
}

/// SpvDecoration
SpvDecoration :: enum cffi.uint {
    RelaxedPrecision                 = 0,
    SpecId                           = 1,
    Block                            = 2,
    BufferBlock                      = 3,
    RowMajor                         = 4,
    ColMajor                         = 5,
    ArrayStride                      = 6,
    MatrixStride                     = 7,
    GLSLShared                       = 8,
    GLSLPacked                       = 9,
    CPacked                          = 10,
    BuiltIn                          = 11,
    NoPerspective                    = 13,
    Flat                             = 14,
    Patch                            = 15,
    Centroid                         = 16,
    Sample                           = 17,
    Invariant                        = 18,
    Restrict                         = 19,
    Aliased                          = 20,
    Volatile                         = 21,
    Constant                         = 22,
    Coherent                         = 23,
    NonWritable                      = 24,
    NonReadable                      = 25,
    Uniform                          = 26,
    UniformId                        = 27,
    SaturatedConversion              = 28,
    Stream                           = 29,
    Location                         = 30,
    Component                        = 31,
    Index                            = 32,
    Binding                          = 33,
    DescriptorSet                    = 34,
    Offset                           = 35,
    XfbBuffer                        = 36,
    XfbStride                        = 37,
    FuncParamAttr                    = 38,
    FPRoundingMode                   = 39,
    FPFastMathMode                   = 40,
    LinkageAttributes                = 41,
    NoContraction                    = 42,
    InputAttachmentIndex             = 43,
    Alignment                        = 44,
    MaxByteOffset                    = 45,
    AlignmentId                      = 46,
    MaxByteOffsetId                  = 47,
    NoSignedWrap                     = 4469,
    NoUnsignedWrap                   = 4470,
    WeightTextureQCOM                = 4487,
    BlockMatchTextureQCOM            = 4488,
    ExplicitInterpAMD                = 4999,
    OverrideCoverageNV               = 5248,
    PassthroughNV                    = 5250,
    ViewportRelativeNV               = 5252,
    SecondaryViewportRelativeNV      = 5256,
    PerPrimitiveEXT                  = 5271,
    PerPrimitiveNV                   = 5271,
    PerViewNV                        = 5272,
    PerTaskNV                        = 5273,
    PerVertexKHR                     = 5285,
    PerVertexNV                      = 5285,
    NonUniform                       = 5300,
    NonUniformEXT                    = 5300,
    RestrictPointer                  = 5355,
    RestrictPointerEXT               = 5355,
    AliasedPointer                   = 5356,
    AliasedPointerEXT                = 5356,
    HitObjectShaderRecordBufferNV    = 5386,
    BindlessSamplerNV                = 5398,
    BindlessImageNV                  = 5399,
    BoundSamplerNV                   = 5400,
    BoundImageNV                     = 5401,
    SIMTCallINTEL                    = 5599,
    ReferencedIndirectlyINTEL        = 5602,
    ClobberINTEL                     = 5607,
    SideEffectsINTEL                 = 5608,
    VectorComputeVariableINTEL       = 5624,
    FuncParamIOKindINTEL             = 5625,
    VectorComputeFunctionINTEL       = 5626,
    StackCallINTEL                   = 5627,
    GlobalVariableOffsetINTEL        = 5628,
    CounterBuffer                    = 5634,
    HlslCounterBufferGOOGLE          = 5634,
    HlslSemanticGOOGLE               = 5635,
    UserSemantic                     = 5635,
    UserTypeGOOGLE                   = 5636,
    FunctionRoundingModeINTEL        = 5822,
    FunctionDenormModeINTEL          = 5823,
    RegisterINTEL                    = 5825,
    MemoryINTEL                      = 5826,
    NumbanksINTEL                    = 5827,
    BankwidthINTEL                   = 5828,
    MaxPrivateCopiesINTEL            = 5829,
    SinglepumpINTEL                  = 5830,
    DoublepumpINTEL                  = 5831,
    MaxReplicatesINTEL               = 5832,
    SimpleDualPortINTEL              = 5833,
    MergeINTEL                       = 5834,
    BankBitsINTEL                    = 5835,
    ForcePow2DepthINTEL              = 5836,
    BurstCoalesceINTEL               = 5899,
    CacheSizeINTEL                   = 5900,
    DontStaticallyCoalesceINTEL      = 5901,
    PrefetchINTEL                    = 5902,
    StallEnableINTEL                 = 5905,
    FuseLoopsInFunctionINTEL         = 5907,
    MathOpDSPModeINTEL               = 5909,
    AliasScopeINTEL                  = 5914,
    NoAliasINTEL                     = 5915,
    InitiationIntervalINTEL          = 5917,
    MaxConcurrencyINTEL              = 5918,
    PipelineEnableINTEL              = 5919,
    BufferLocationINTEL              = 5921,
    IOPipeStorageINTEL               = 5944,
    FunctionFloatingPointModeINTEL   = 6080,
    SingleElementVectorINTEL         = 6085,
    VectorComputeCallableFunctionINTEL = 6087,
    MediaBlockIOINTEL                = 6140,
    LatencyControlLabelINTEL         = 6172,
    LatencyControlConstraintINTEL    = 6173,
    ConduitKernelArgumentINTEL       = 6175,
    RegisterMapKernelArgumentINTEL   = 6176,
    MMHostInterfaceAddressWidthINTEL = 6177,
    MMHostInterfaceDataWidthINTEL    = 6178,
    MMHostInterfaceLatencyINTEL      = 6179,
    MMHostInterfaceReadWriteModeINTEL = 6180,
    MMHostInterfaceMaxBurstINTEL     = 6181,
    MMHostInterfaceWaitRequestINTEL  = 6182,
    StableKernelArgumentINTEL        = 6183,
    Max                              = 2147483647,
}

/// SpvBuiltIn
SpvBuiltIn :: enum cffi.uint {
    Position                      = 0,
    PointSize                     = 1,
    ClipDistance                  = 3,
    CullDistance                  = 4,
    VertexId                      = 5,
    InstanceId                    = 6,
    PrimitiveId                   = 7,
    InvocationId                  = 8,
    Layer                         = 9,
    ViewportIndex                 = 10,
    TessLevelOuter                = 11,
    TessLevelInner                = 12,
    TessCoord                     = 13,
    PatchVertices                 = 14,
    FragCoord                     = 15,
    PointCoord                    = 16,
    FrontFacing                   = 17,
    SampleId                      = 18,
    SamplePosition                = 19,
    SampleMask                    = 20,
    FragDepth                     = 22,
    HelperInvocation              = 23,
    NumWorkgroups                 = 24,
    WorkgroupSize                 = 25,
    WorkgroupId                   = 26,
    LocalInvocationId             = 27,
    GlobalInvocationId            = 28,
    LocalInvocationIndex          = 29,
    WorkDim                       = 30,
    GlobalSize                    = 31,
    EnqueuedWorkgroupSize         = 32,
    GlobalOffset                  = 33,
    GlobalLinearId                = 34,
    SubgroupSize                  = 36,
    SubgroupMaxSize               = 37,
    NumSubgroups                  = 38,
    NumEnqueuedSubgroups          = 39,
    SubgroupId                    = 40,
    SubgroupLocalInvocationId     = 41,
    VertexIndex                   = 42,
    InstanceIndex                 = 43,
    CoreIDARM                     = 4160,
    CoreCountARM                  = 4161,
    CoreMaxIDARM                  = 4162,
    WarpIDARM                     = 4163,
    WarpMaxIDARM                  = 4164,
    SubgroupEqMask                = 4416,
    SubgroupEqMaskKHR             = 4416,
    SubgroupGeMask                = 4417,
    SubgroupGeMaskKHR             = 4417,
    SubgroupGtMask                = 4418,
    SubgroupGtMaskKHR             = 4418,
    SubgroupLeMask                = 4419,
    SubgroupLeMaskKHR             = 4419,
    SubgroupLtMask                = 4420,
    SubgroupLtMaskKHR             = 4420,
    BaseVertex                    = 4424,
    BaseInstance                  = 4425,
    DrawIndex                     = 4426,
    PrimitiveShadingRateKHR       = 4432,
    DeviceIndex                   = 4438,
    ViewIndex                     = 4440,
    ShadingRateKHR                = 4444,
    BaryCoordNoPerspAMD           = 4992,
    BaryCoordNoPerspCentroidAMD   = 4993,
    BaryCoordNoPerspSampleAMD     = 4994,
    BaryCoordSmoothAMD            = 4995,
    BaryCoordSmoothCentroidAMD    = 4996,
    BaryCoordSmoothSampleAMD      = 4997,
    BaryCoordPullModelAMD         = 4998,
    FragStencilRefEXT             = 5014,
    ViewportMaskNV                = 5253,
    SecondaryPositionNV           = 5257,
    SecondaryViewportMaskNV       = 5258,
    PositionPerViewNV             = 5261,
    ViewportMaskPerViewNV         = 5262,
    FullyCoveredEXT               = 5264,
    TaskCountNV                   = 5274,
    PrimitiveCountNV              = 5275,
    PrimitiveIndicesNV            = 5276,
    ClipDistancePerViewNV         = 5277,
    CullDistancePerViewNV         = 5278,
    LayerPerViewNV                = 5279,
    MeshViewCountNV               = 5280,
    MeshViewIndicesNV             = 5281,
    BaryCoordKHR                  = 5286,
    BaryCoordNV                   = 5286,
    BaryCoordNoPerspKHR           = 5287,
    BaryCoordNoPerspNV            = 5287,
    FragSizeEXT                   = 5292,
    FragmentSizeNV                = 5292,
    FragInvocationCountEXT        = 5293,
    InvocationsPerPixelNV         = 5293,
    PrimitivePointIndicesEXT      = 5294,
    PrimitiveLineIndicesEXT       = 5295,
    PrimitiveTriangleIndicesEXT   = 5296,
    CullPrimitiveEXT              = 5299,
    LaunchIdKHR                   = 5319,
    LaunchIdNV                    = 5319,
    LaunchSizeKHR                 = 5320,
    LaunchSizeNV                  = 5320,
    WorldRayOriginKHR             = 5321,
    WorldRayOriginNV              = 5321,
    WorldRayDirectionKHR          = 5322,
    WorldRayDirectionNV           = 5322,
    ObjectRayOriginKHR            = 5323,
    ObjectRayOriginNV             = 5323,
    ObjectRayDirectionKHR         = 5324,
    ObjectRayDirectionNV          = 5324,
    RayTminKHR                    = 5325,
    RayTminNV                     = 5325,
    RayTmaxKHR                    = 5326,
    RayTmaxNV                     = 5326,
    InstanceCustomIndexKHR        = 5327,
    InstanceCustomIndexNV         = 5327,
    ObjectToWorldKHR              = 5330,
    ObjectToWorldNV               = 5330,
    WorldToObjectKHR              = 5331,
    WorldToObjectNV               = 5331,
    HitTNV                        = 5332,
    HitKindKHR                    = 5333,
    HitKindNV                     = 5333,
    CurrentRayTimeNV              = 5334,
    HitTriangleVertexPositionsKHR = 5335,
    IncomingRayFlagsKHR           = 5351,
    IncomingRayFlagsNV            = 5351,
    RayGeometryIndexKHR           = 5352,
    WarpsPerSMNV                  = 5374,
    SMCountNV                     = 5375,
    WarpIDNV                      = 5376,
    SMIDNV                        = 5377,
    CullMaskKHR                   = 6021,
    Max                           = 2147483647,
}

/// SpvSelectionControlShift
SpvSelectionControlShift :: enum cffi.uint {
    FlattenShift     = 0,
    DontFlattenShift = 1,
    Max              = 2147483647,
}

/// SpvSelectionControlMask
SpvSelectionControlFlag :: enum cffi.uint {
    FlattenMask     = 0,
    DontFlattenMask = 1,
}
SpvSelectionControlMask :: bit_set[SpvSelectionControlFlag; cffi.uint]

/// SpvLoopControlShift
SpvLoopControlShift :: enum cffi.uint {
    UnrollShift                    = 0,
    DontUnrollShift                = 1,
    DependencyInfiniteShift        = 2,
    DependencyLengthShift          = 3,
    MinIterationsShift             = 4,
    MaxIterationsShift             = 5,
    IterationMultipleShift         = 6,
    PeelCountShift                 = 7,
    PartialCountShift              = 8,
    InitiationIntervalINTELShift   = 16,
    MaxConcurrencyINTELShift       = 17,
    DependencyArrayINTELShift      = 18,
    PipelineEnableINTELShift       = 19,
    LoopCoalesceINTELShift         = 20,
    MaxInterleavingINTELShift      = 21,
    SpeculatedIterationsINTELShift = 22,
    NoFusionINTELShift             = 23,
    LoopCountINTELShift            = 24,
    MaxReinvocationDelayINTELShift = 25,
    Max                            = 2147483647,
}

/// SpvLoopControlMask
SpvLoopControlFlag :: enum cffi.uint {
    UnrollMask                    = 0,
    DontUnrollMask                = 1,
    DependencyInfiniteMask        = 2,
    DependencyLengthMask          = 3,
    MinIterationsMask             = 4,
    MaxIterationsMask             = 5,
    IterationMultipleMask         = 6,
    PeelCountMask                 = 7,
    PartialCountMask              = 8,
    InitiationIntervalINTELMask   = 16,
    MaxConcurrencyINTELMask       = 17,
    DependencyArrayINTELMask      = 18,
    PipelineEnableINTELMask       = 19,
    LoopCoalesceINTELMask         = 20,
    MaxInterleavingINTELMask      = 21,
    SpeculatedIterationsINTELMask = 22,
    NoFusionINTELMask             = 23,
    LoopCountINTELMask            = 24,
    MaxReinvocationDelayINTELMask = 25,
}
SpvLoopControlMask :: bit_set[SpvLoopControlFlag; cffi.uint]

/// SpvFunctionControlShift
SpvFunctionControlShift :: enum cffi.uint {
    InlineShift       = 0,
    DontInlineShift   = 1,
    PureShift         = 2,
    ConstShift        = 3,
    OptNoneINTELShift = 16,
    Max               = 2147483647,
}

/// SpvFunctionControlMask
SpvFunctionControlFlag :: enum cffi.uint {
    InlineMask       = 0,
    DontInlineMask   = 1,
    PureMask         = 2,
    ConstMask        = 3,
    OptNoneINTELMask = 16,
}
SpvFunctionControlMask :: bit_set[SpvFunctionControlFlag; cffi.uint]

/// SpvMemorySemanticsShift
SpvMemorySemanticsShift :: enum cffi.uint {
    AcquireShift                = 1,
    ReleaseShift                = 2,
    AcquireReleaseShift         = 3,
    SequentiallyConsistentShift = 4,
    UniformMemoryShift          = 6,
    SubgroupMemoryShift         = 7,
    WorkgroupMemoryShift        = 8,
    CrossWorkgroupMemoryShift   = 9,
    AtomicCounterMemoryShift    = 10,
    ImageMemoryShift            = 11,
    OutputMemoryShift           = 12,
    OutputMemoryKHRShift        = 12,
    MakeAvailableShift          = 13,
    MakeAvailableKHRShift       = 13,
    MakeVisibleShift            = 14,
    MakeVisibleKHRShift         = 14,
    VolatileShift               = 15,
    Max                         = 2147483647,
}

/// SpvMemorySemanticsMask
SpvMemorySemanticsFlag :: enum cffi.uint {
    AcquireMask                = 1,
    ReleaseMask                = 2,
    AcquireReleaseMask         = 3,
    SequentiallyConsistentMask = 4,
    UniformMemoryMask          = 6,
    SubgroupMemoryMask         = 7,
    WorkgroupMemoryMask        = 8,
    CrossWorkgroupMemoryMask   = 9,
    AtomicCounterMemoryMask    = 10,
    ImageMemoryMask            = 11,
    OutputMemoryMask           = 12,
    OutputMemoryKHRMask        = 12,
    MakeAvailableMask          = 13,
    MakeAvailableKHRMask       = 13,
    MakeVisibleMask            = 14,
    MakeVisibleKHRMask         = 14,
    VolatileMask               = 15,
}
SpvMemorySemanticsMask :: bit_set[SpvMemorySemanticsFlag; cffi.uint]

/// SpvMemoryAccessShift
SpvMemoryAccessShift :: enum cffi.uint {
    VolatileShift                = 0,
    AlignedShift                 = 1,
    NontemporalShift             = 2,
    MakePointerAvailableShift    = 3,
    MakePointerAvailableKHRShift = 3,
    MakePointerVisibleShift      = 4,
    MakePointerVisibleKHRShift   = 4,
    NonPrivatePointerShift       = 5,
    NonPrivatePointerKHRShift    = 5,
    AliasScopeINTELMaskShift     = 16,
    NoAliasINTELMaskShift        = 17,
    Max                          = 2147483647,
}

/// SpvMemoryAccessMask
SpvMemoryAccessFlag :: enum cffi.uint {
    VolatileMask                = 0,
    AlignedMask                 = 1,
    NontemporalMask             = 2,
    MakePointerAvailableMask    = 3,
    MakePointerAvailableKHRMask = 3,
    MakePointerVisibleMask      = 4,
    MakePointerVisibleKHRMask   = 4,
    NonPrivatePointerMask       = 5,
    NonPrivatePointerKHRMask    = 5,
    AliasScopeINTELMaskMask     = 16,
    NoAliasINTELMaskMask        = 17,
}
SpvMemoryAccessMask :: bit_set[SpvMemoryAccessFlag; cffi.uint]

/// SpvScope
SpvScope :: enum cffi.uint {
    CrossDevice    = 0,
    Device         = 1,
    Workgroup      = 2,
    Subgroup       = 3,
    Invocation     = 4,
    QueueFamily    = 5,
    QueueFamilyKHR = 5,
    ShaderCallKHR  = 6,
    Max            = 2147483647,
}

/// SpvGroupOperation
SpvGroupOperation :: enum cffi.uint {
    Reduce                     = 0,
    InclusiveScan              = 1,
    ExclusiveScan              = 2,
    ClusteredReduce            = 3,
    PartitionedReduceNV        = 6,
    PartitionedInclusiveScanNV = 7,
    PartitionedExclusiveScanNV = 8,
    Max                        = 2147483647,
}

/// SpvKernelEnqueueFlags
SpvKernelEnqueueFlag :: enum cffi.uint {
    WaitKernel    = 0,
    WaitWorkGroup = 1,
}
SpvKernelEnqueueFlags :: bit_set[SpvKernelEnqueueFlag; cffi.uint]

/// SpvKernelProfilingInfoShift
SpvKernelProfilingInfoShift :: enum cffi.uint {
    CmdExecTimeShift = 0,
    Max              = 2147483647,
}

/// SpvKernelProfilingInfoMask
SpvKernelProfilingInfoFlag :: enum cffi.uint {
    CmdExecTimeMask = 0,
}
SpvKernelProfilingInfoMask :: bit_set[SpvKernelProfilingInfoFlag; cffi.uint]

/// SpvCapability
SpvCapability :: enum cffi.uint {
    Matrix                           = 0,
    Shader                           = 1,
    Geometry                         = 2,
    Tessellation                     = 3,
    Addresses                        = 4,
    Linkage                          = 5,
    Kernel                           = 6,
    Vector16                         = 7,
    Float16Buffer                    = 8,
    Float16                          = 9,
    Float64                          = 10,
    Int64                            = 11,
    Int64Atomics                     = 12,
    ImageBasic                       = 13,
    ImageReadWrite                   = 14,
    ImageMipmap                      = 15,
    Pipes                            = 17,
    Groups                           = 18,
    DeviceEnqueue                    = 19,
    LiteralSampler                   = 20,
    AtomicStorage                    = 21,
    Int16                            = 22,
    TessellationPointSize            = 23,
    GeometryPointSize                = 24,
    ImageGatherExtended              = 25,
    StorageImageMultisample          = 27,
    UniformBufferArrayDynamicIndexing = 28,
    SampledImageArrayDynamicIndexing = 29,
    StorageBufferArrayDynamicIndexing = 30,
    StorageImageArrayDynamicIndexing = 31,
    ClipDistance                     = 32,
    CullDistance                     = 33,
    ImageCubeArray                   = 34,
    SampleRateShading                = 35,
    ImageRect                        = 36,
    SampledRect                      = 37,
    GenericPointer                   = 38,
    Int8                             = 39,
    InputAttachment                  = 40,
    SparseResidency                  = 41,
    MinLod                           = 42,
    Sampled1D                        = 43,
    Image1D                          = 44,
    SampledCubeArray                 = 45,
    SampledBuffer                    = 46,
    ImageBuffer                      = 47,
    ImageMSArray                     = 48,
    StorageImageExtendedFormats      = 49,
    ImageQuery                       = 50,
    DerivativeControl                = 51,
    InterpolationFunction            = 52,
    TransformFeedback                = 53,
    GeometryStreams                  = 54,
    StorageImageReadWithoutFormat    = 55,
    StorageImageWriteWithoutFormat   = 56,
    MultiViewport                    = 57,
    SubgroupDispatch                 = 58,
    NamedBarrier                     = 59,
    PipeStorage                      = 60,
    GroupNonUniform                  = 61,
    GroupNonUniformVote              = 62,
    GroupNonUniformArithmetic        = 63,
    GroupNonUniformBallot            = 64,
    GroupNonUniformShuffle           = 65,
    GroupNonUniformShuffleRelative   = 66,
    GroupNonUniformClustered         = 67,
    GroupNonUniformQuad              = 68,
    ShaderLayer                      = 69,
    ShaderViewportIndex              = 70,
    UniformDecoration                = 71,
    CoreBuiltinsARM                  = 4165,
    TileImageColorReadAccessEXT      = 4166,
    TileImageDepthReadAccessEXT      = 4167,
    TileImageStencilReadAccessEXT    = 4168,
    FragmentShadingRateKHR           = 4422,
    SubgroupBallotKHR                = 4423,
    DrawParameters                   = 4427,
    WorkgroupMemoryExplicitLayoutKHR = 4428,
    WorkgroupMemoryExplicitLayout8BitAccessKHR = 4429,
    WorkgroupMemoryExplicitLayout16BitAccessKHR = 4430,
    SubgroupVoteKHR                  = 4431,
    StorageBuffer16BitAccess         = 4433,
    StorageUniformBufferBlock16      = 4433,
    StorageUniform16                 = 4434,
    UniformAndStorageBuffer16BitAccess = 4434,
    StoragePushConstant16            = 4435,
    StorageInputOutput16             = 4436,
    DeviceGroup                      = 4437,
    MultiView                        = 4439,
    VariablePointersStorageBuffer    = 4441,
    VariablePointers                 = 4442,
    AtomicStorageOps                 = 4445,
    SampleMaskPostDepthCoverage      = 4447,
    StorageBuffer8BitAccess          = 4448,
    UniformAndStorageBuffer8BitAccess = 4449,
    StoragePushConstant8             = 4450,
    DenormPreserve                   = 4464,
    DenormFlushToZero                = 4465,
    SignedZeroInfNanPreserve         = 4466,
    RoundingModeRTE                  = 4467,
    RoundingModeRTZ                  = 4468,
    RayQueryProvisionalKHR           = 4471,
    RayQueryKHR                      = 4472,
    RayTraversalPrimitiveCullingKHR  = 4478,
    RayTracingKHR                    = 4479,
    TextureSampleWeightedQCOM        = 4484,
    TextureBoxFilterQCOM             = 4485,
    TextureBlockMatchQCOM            = 4486,
    Float16ImageAMD                  = 5008,
    ImageGatherBiasLodAMD            = 5009,
    FragmentMaskAMD                  = 5010,
    StencilExportEXT                 = 5013,
    ImageReadWriteLodAMD             = 5015,
    Int64ImageEXT                    = 5016,
    ShaderClockKHR                   = 5055,
    SampleMaskOverrideCoverageNV     = 5249,
    GeometryShaderPassthroughNV      = 5251,
    ShaderViewportIndexLayerEXT      = 5254,
    ShaderViewportIndexLayerNV       = 5254,
    ShaderViewportMaskNV             = 5255,
    ShaderStereoViewNV               = 5259,
    PerViewAttributesNV              = 5260,
    FragmentFullyCoveredEXT          = 5265,
    MeshShadingNV                    = 5266,
    ImageFootprintNV                 = 5282,
    MeshShadingEXT                   = 5283,
    FragmentBarycentricKHR           = 5284,
    FragmentBarycentricNV            = 5284,
    ComputeDerivativeGroupQuadsNV    = 5288,
    FragmentDensityEXT               = 5291,
    ShadingRateNV                    = 5291,
    GroupNonUniformPartitionedNV     = 5297,
    ShaderNonUniform                 = 5301,
    ShaderNonUniformEXT              = 5301,
    RuntimeDescriptorArray           = 5302,
    RuntimeDescriptorArrayEXT        = 5302,
    InputAttachmentArrayDynamicIndexing = 5303,
    InputAttachmentArrayDynamicIndexingEXT = 5303,
    UniformTexelBufferArrayDynamicIndexing = 5304,
    UniformTexelBufferArrayDynamicIndexingEXT = 5304,
    StorageTexelBufferArrayDynamicIndexing = 5305,
    StorageTexelBufferArrayDynamicIndexingEXT = 5305,
    UniformBufferArrayNonUniformIndexing = 5306,
    UniformBufferArrayNonUniformIndexingEXT = 5306,
    SampledImageArrayNonUniformIndexing = 5307,
    SampledImageArrayNonUniformIndexingEXT = 5307,
    StorageBufferArrayNonUniformIndexing = 5308,
    StorageBufferArrayNonUniformIndexingEXT = 5308,
    StorageImageArrayNonUniformIndexing = 5309,
    StorageImageArrayNonUniformIndexingEXT = 5309,
    InputAttachmentArrayNonUniformIndexing = 5310,
    InputAttachmentArrayNonUniformIndexingEXT = 5310,
    UniformTexelBufferArrayNonUniformIndexing = 5311,
    UniformTexelBufferArrayNonUniformIndexingEXT = 5311,
    StorageTexelBufferArrayNonUniformIndexing = 5312,
    StorageTexelBufferArrayNonUniformIndexingEXT = 5312,
    RayTracingPositionFetchKHR       = 5336,
    RayTracingNV                     = 5340,
    RayTracingMotionBlurNV           = 5341,
    VulkanMemoryModel                = 5345,
    VulkanMemoryModelKHR             = 5345,
    VulkanMemoryModelDeviceScope     = 5346,
    VulkanMemoryModelDeviceScopeKHR  = 5346,
    PhysicalStorageBufferAddresses   = 5347,
    PhysicalStorageBufferAddressesEXT = 5347,
    ComputeDerivativeGroupLinearNV   = 5350,
    RayTracingProvisionalKHR         = 5353,
    CooperativeMatrixNV              = 5357,
    FragmentShaderSampleInterlockEXT = 5363,
    FragmentShaderShadingRateInterlockEXT = 5372,
    ShaderSMBuiltinsNV               = 5373,
    FragmentShaderPixelInterlockEXT  = 5378,
    DemoteToHelperInvocation         = 5379,
    DemoteToHelperInvocationEXT      = 5379,
    RayTracingOpacityMicromapEXT     = 5381,
    ShaderInvocationReorderNV        = 5383,
    BindlessTextureNV                = 5390,
    RayQueryPositionFetchKHR         = 5391,
    SubgroupShuffleINTEL             = 5568,
    SubgroupBufferBlockIOINTEL       = 5569,
    SubgroupImageBlockIOINTEL        = 5570,
    SubgroupImageMediaBlockIOINTEL   = 5579,
    RoundToInfinityINTEL             = 5582,
    FloatingPointModeINTEL           = 5583,
    IntegerFunctions2INTEL           = 5584,
    FunctionPointersINTEL            = 5603,
    IndirectReferencesINTEL          = 5604,
    AsmINTEL                         = 5606,
    AtomicFloat32MinMaxEXT           = 5612,
    AtomicFloat64MinMaxEXT           = 5613,
    AtomicFloat16MinMaxEXT           = 5616,
    VectorComputeINTEL               = 5617,
    VectorAnyINTEL                   = 5619,
    ExpectAssumeKHR                  = 5629,
    SubgroupAvcMotionEstimationINTEL = 5696,
    SubgroupAvcMotionEstimationIntraINTEL = 5697,
    SubgroupAvcMotionEstimationChromaINTEL = 5698,
    VariableLengthArrayINTEL         = 5817,
    FunctionFloatControlINTEL        = 5821,
    FPGAMemoryAttributesINTEL        = 5824,
    FPFastMathModeINTEL              = 5837,
    ArbitraryPrecisionIntegersINTEL  = 5844,
    ArbitraryPrecisionFloatingPointINTEL = 5845,
    UnstructuredLoopControlsINTEL    = 5886,
    FPGALoopControlsINTEL            = 5888,
    KernelAttributesINTEL            = 5892,
    FPGAKernelAttributesINTEL        = 5897,
    FPGAMemoryAccessesINTEL          = 5898,
    FPGAClusterAttributesINTEL       = 5904,
    LoopFuseINTEL                    = 5906,
    FPGADSPControlINTEL              = 5908,
    MemoryAccessAliasingINTEL        = 5910,
    FPGAInvocationPipeliningAttributesINTEL = 5916,
    FPGABufferLocationINTEL          = 5920,
    ArbitraryPrecisionFixedPointINTEL = 5922,
    USMStorageClassesINTEL           = 5935,
    RuntimeAlignedAttributeINTEL     = 5939,
    IOPipesINTEL                     = 5943,
    BlockingPipesINTEL               = 5945,
    FPGARegINTEL                     = 5948,
    DotProductInputAll               = 6016,
    DotProductInputAllKHR            = 6016,
    DotProductInput4x8Bit            = 6017,
    DotProductInput4x8BitKHR         = 6017,
    DotProductInput4x8BitPacked      = 6018,
    DotProductInput4x8BitPackedKHR   = 6018,
    DotProduct                       = 6019,
    DotProductKHR                    = 6019,
    RayCullMaskKHR                   = 6020,
    CooperativeMatrixKHR             = 6022,
    BitInstructions                  = 6025,
    GroupNonUniformRotateKHR         = 6026,
    AtomicFloat32AddEXT              = 6033,
    AtomicFloat64AddEXT              = 6034,
    LongConstantCompositeINTEL       = 6089,
    OptNoneINTEL                     = 6094,
    AtomicFloat16AddEXT              = 6095,
    DebugInfoModuleINTEL             = 6114,
    BFloat16ConversionINTEL          = 6115,
    SplitBarrierINTEL                = 6141,
    FPGAKernelAttributesv2INTEL      = 6161,
    FPGALatencyControlINTEL          = 6171,
    FPGAArgumentInterfacesINTEL      = 6174,
    GroupUniformArithmeticKHR        = 6400,
    Max                              = 2147483647,
}

/// SpvRayFlagsShift
SpvRayFlagsShift :: enum cffi.uint {
    OpaqueKHRShift                   = 0,
    NoOpaqueKHRShift                 = 1,
    TerminateOnFirstHitKHRShift      = 2,
    SkipClosestHitShaderKHRShift     = 3,
    CullBackFacingTrianglesKHRShift  = 4,
    CullFrontFacingTrianglesKHRShift = 5,
    CullOpaqueKHRShift               = 6,
    CullNoOpaqueKHRShift             = 7,
    SkipTrianglesKHRShift            = 8,
    SkipAABBsKHRShift                = 9,
    ForceOpacityMicromap2StateEXTShift = 10,
    Max                              = 2147483647,
}

/// SpvRayFlagsMask
SpvRayFlagsFlag :: enum cffi.uint {
    OpaqueKHRMask                    = 0,
    NoOpaqueKHRMask                  = 1,
    TerminateOnFirstHitKHRMask       = 2,
    SkipClosestHitShaderKHRMask      = 3,
    CullBackFacingTrianglesKHRMask   = 4,
    CullFrontFacingTrianglesKHRMask  = 5,
    CullOpaqueKHRMask                = 6,
    CullNoOpaqueKHRMask              = 7,
    SkipTrianglesKHRMask             = 8,
    SkipAABBsKHRMask                 = 9,
    ForceOpacityMicromap2StateEXTMask = 10,
}
SpvRayFlagsMask :: bit_set[SpvRayFlagsFlag; cffi.uint]

/// SpvRayQueryIntersection
SpvRayQueryIntersection :: enum cffi.uint {
    RayQueryCandidateIntersectionKHR = 0,
    RayQueryCommittedIntersectionKHR = 1,
    Max                              = 2147483647,
}

/// SpvRayQueryCommittedIntersectionType
SpvRayQueryCommittedIntersectionType :: enum cffi.uint {
    RayQueryCommittedIntersectionNoneKHR = 0,
    RayQueryCommittedIntersectionTriangleKHR = 1,
    RayQueryCommittedIntersectionGeneratedKHR = 2,
    Max                              = 2147483647,
}

/// SpvRayQueryCandidateIntersectionType
SpvRayQueryCandidateIntersectionType :: enum cffi.uint {
    RayQueryCandidateIntersectionTriangleKHR = 0,
    RayQueryCandidateIntersectionAABBKHR = 1,
    Max                              = 2147483647,
}

/// SpvFragmentShadingRateShift
SpvFragmentShadingRateShift :: enum cffi.uint {
    Vertical2PixelsShift   = 0,
    Vertical4PixelsShift   = 1,
    Horizontal2PixelsShift = 2,
    Horizontal4PixelsShift = 3,
    Max                    = 2147483647,
}

/// SpvFragmentShadingRateMask
SpvFragmentShadingRateFlag :: enum cffi.uint {
    Vertical2PixelsMask   = 0,
    Vertical4PixelsMask   = 1,
    Horizontal2PixelsMask = 2,
    Horizontal4PixelsMask = 3,
}
SpvFragmentShadingRateMask :: bit_set[SpvFragmentShadingRateFlag; cffi.uint]

/// SpvFPDenormMode
SpvFPDenormMode :: enum cffi.uint {
    Preserve    = 0,
    FlushToZero = 1,
    Max         = 2147483647,
}

/// SpvFPOperationMode
SpvFPOperationMode :: enum cffi.uint {
    IEEE = 0,
    ALT  = 1,
    Max  = 2147483647,
}

/// SpvQuantizationModes
SpvQuantizationModes :: enum cffi.uint {
    TRN          = 0,
    TRN_ZERO     = 1,
    RND          = 2,
    RND_ZERO     = 3,
    RND_INF      = 4,
    RND_MIN_INF  = 5,
    RND_CONV     = 6,
    RND_CONV_ODD = 7,
    Max          = 2147483647,
}

/// SpvOverflowModes
SpvOverflowModes :: enum cffi.uint {
    WRAP     = 0,
    SAT      = 1,
    SAT_ZERO = 2,
    SAT_SYM  = 3,
    Max      = 2147483647,
}

/// SpvPackedVectorFormat
SpvPackedVectorFormat :: enum cffi.uint {
    PackedVectorFormat4x8Bit    = 0,
    PackedVectorFormat4x8BitKHR = 0,
    Max                         = 2147483647,
}

/// SpvCooperativeMatrixOperandsShift
SpvCooperativeMatrixOperandsShift :: enum cffi.uint {
    MatrixASignedComponentsShift     = 0,
    MatrixBSignedComponentsShift     = 1,
    MatrixCSignedComponentsShift     = 2,
    MatrixResultSignedComponentsShift = 3,
    SaturatingAccumulationShift      = 4,
    Max                              = 2147483647,
}

/// SpvCooperativeMatrixOperandsMask
SpvCooperativeMatrixOperandsFlag :: enum cffi.uint {
    MatrixASignedComponentsMask      = 0,
    MatrixBSignedComponentsMask      = 1,
    MatrixCSignedComponentsMask      = 2,
    MatrixResultSignedComponentsMask = 3,
    SaturatingAccumulationMask       = 4,
}
SpvCooperativeMatrixOperandsMask :: bit_set[SpvCooperativeMatrixOperandsFlag; cffi.uint]

/// SpvCooperativeMatrixLayout
SpvCooperativeMatrixLayout :: enum cffi.uint {
    RowMajorKHR    = 0,
    ColumnMajorKHR = 1,
    Max            = 2147483647,
}

/// SpvCooperativeMatrixUse
SpvCooperativeMatrixUse :: enum cffi.uint {
    trixAKHR           = 0,
    trixBKHR           = 1,
    trixAccumulatorKHR = 2,
    x                  = 2147483647,
}

/// SpvOp
SpvOp :: enum cffi.uint {
    Nop                              = 0,
    Undef                            = 1,
    SourceContinued                  = 2,
    Source                           = 3,
    SourceExtension                  = 4,
    Name                             = 5,
    MemberName                       = 6,
    String                           = 7,
    Line                             = 8,
    Extension                        = 10,
    ExtInstImport                    = 11,
    ExtInst                          = 12,
    MemoryModel                      = 14,
    EntryPoint                       = 15,
    ExecutionMode                    = 16,
    Capability                       = 17,
    TypeVoid                         = 19,
    TypeBool                         = 20,
    TypeInt                          = 21,
    TypeFloat                        = 22,
    TypeVector                       = 23,
    TypeMatrix                       = 24,
    TypeImage                        = 25,
    TypeSampler                      = 26,
    TypeSampledImage                 = 27,
    TypeArray                        = 28,
    TypeRuntimeArray                 = 29,
    TypeStruct                       = 30,
    TypeOpaque                       = 31,
    TypePointer                      = 32,
    TypeFunction                     = 33,
    TypeEvent                        = 34,
    TypeDeviceEvent                  = 35,
    TypeReserveId                    = 36,
    TypeQueue                        = 37,
    TypePipe                         = 38,
    TypeForwardPointer               = 39,
    ConstantTrue                     = 41,
    ConstantFalse                    = 42,
    Constant                         = 43,
    ConstantComposite                = 44,
    ConstantSampler                  = 45,
    ConstantNull                     = 46,
    SpecConstantTrue                 = 48,
    SpecConstantFalse                = 49,
    SpecConstant                     = 50,
    SpecConstantComposite            = 51,
    SpecConstantOp                   = 52,
    Function                         = 54,
    FunctionParameter                = 55,
    FunctionEnd                      = 56,
    FunctionCall                     = 57,
    Variable                         = 59,
    ImageTexelPointer                = 60,
    Load                             = 61,
    Store                            = 62,
    CopyMemory                       = 63,
    CopyMemorySized                  = 64,
    AccessChain                      = 65,
    InBoundsAccessChain              = 66,
    PtrAccessChain                   = 67,
    ArrayLength                      = 68,
    GenericPtrMemSemantics           = 69,
    InBoundsPtrAccessChain           = 70,
    Decorate                         = 71,
    MemberDecorate                   = 72,
    DecorationGroup                  = 73,
    GroupDecorate                    = 74,
    GroupMemberDecorate              = 75,
    VectorExtractDynamic             = 77,
    VectorInsertDynamic              = 78,
    VectorShuffle                    = 79,
    CompositeConstruct               = 80,
    CompositeExtract                 = 81,
    CompositeInsert                  = 82,
    CopyObject                       = 83,
    Transpose                        = 84,
    SampledImage                     = 86,
    ImageSampleImplicitLod           = 87,
    ImageSampleExplicitLod           = 88,
    ImageSampleDrefImplicitLod       = 89,
    ImageSampleDrefExplicitLod       = 90,
    ImageSampleProjImplicitLod       = 91,
    ImageSampleProjExplicitLod       = 92,
    ImageSampleProjDrefImplicitLod   = 93,
    ImageSampleProjDrefExplicitLod   = 94,
    ImageFetch                       = 95,
    ImageGather                      = 96,
    ImageDrefGather                  = 97,
    ImageRead                        = 98,
    ImageWrite                       = 99,
    Image                            = 100,
    ImageQueryFormat                 = 101,
    ImageQueryOrder                  = 102,
    ImageQuerySizeLod                = 103,
    ImageQuerySize                   = 104,
    ImageQueryLod                    = 105,
    ImageQueryLevels                 = 106,
    ImageQuerySamples                = 107,
    ConvertFToU                      = 109,
    ConvertFToS                      = 110,
    ConvertSToF                      = 111,
    ConvertUToF                      = 112,
    UConvert                         = 113,
    SConvert                         = 114,
    FConvert                         = 115,
    QuantizeToF16                    = 116,
    ConvertPtrToU                    = 117,
    SatConvertSToU                   = 118,
    SatConvertUToS                   = 119,
    ConvertUToPtr                    = 120,
    PtrCastToGeneric                 = 121,
    GenericCastToPtr                 = 122,
    GenericCastToPtrExplicit         = 123,
    Bitcast                          = 124,
    SNegate                          = 126,
    FNegate                          = 127,
    IAdd                             = 128,
    FAdd                             = 129,
    ISub                             = 130,
    FSub                             = 131,
    IMul                             = 132,
    FMul                             = 133,
    UDiv                             = 134,
    SDiv                             = 135,
    FDiv                             = 136,
    UMod                             = 137,
    SRem                             = 138,
    SMod                             = 139,
    FRem                             = 140,
    FMod                             = 141,
    VectorTimesScalar                = 142,
    MatrixTimesScalar                = 143,
    VectorTimesMatrix                = 144,
    MatrixTimesVector                = 145,
    MatrixTimesMatrix                = 146,
    OuterProduct                     = 147,
    Dot                              = 148,
    IAddCarry                        = 149,
    ISubBorrow                       = 150,
    UMulExtended                     = 151,
    SMulExtended                     = 152,
    Any                              = 154,
    All                              = 155,
    IsNan                            = 156,
    IsInf                            = 157,
    IsFinite                         = 158,
    IsNormal                         = 159,
    SignBitSet                       = 160,
    LessOrGreater                    = 161,
    Ordered                          = 162,
    Unordered                        = 163,
    LogicalEqual                     = 164,
    LogicalNotEqual                  = 165,
    LogicalOr                        = 166,
    LogicalAnd                       = 167,
    LogicalNot                       = 168,
    Select                           = 169,
    IEqual                           = 170,
    INotEqual                        = 171,
    UGreaterThan                     = 172,
    SGreaterThan                     = 173,
    UGreaterThanEqual                = 174,
    SGreaterThanEqual                = 175,
    ULessThan                        = 176,
    SLessThan                        = 177,
    ULessThanEqual                   = 178,
    SLessThanEqual                   = 179,
    FOrdEqual                        = 180,
    FUnordEqual                      = 181,
    FOrdNotEqual                     = 182,
    FUnordNotEqual                   = 183,
    FOrdLessThan                     = 184,
    FUnordLessThan                   = 185,
    FOrdGreaterThan                  = 186,
    FUnordGreaterThan                = 187,
    FOrdLessThanEqual                = 188,
    FUnordLessThanEqual              = 189,
    FOrdGreaterThanEqual             = 190,
    FUnordGreaterThanEqual           = 191,
    ShiftRightLogical                = 194,
    ShiftRightArithmetic             = 195,
    ShiftLeftLogical                 = 196,
    BitwiseOr                        = 197,
    BitwiseXor                       = 198,
    BitwiseAnd                       = 199,
    Not                              = 200,
    BitFieldInsert                   = 201,
    BitFieldSExtract                 = 202,
    BitFieldUExtract                 = 203,
    BitReverse                       = 204,
    BitCount                         = 205,
    DPdx                             = 207,
    DPdy                             = 208,
    Fwidth                           = 209,
    DPdxFine                         = 210,
    DPdyFine                         = 211,
    FwidthFine                       = 212,
    DPdxCoarse                       = 213,
    DPdyCoarse                       = 214,
    FwidthCoarse                     = 215,
    EmitVertex                       = 218,
    EndPrimitive                     = 219,
    EmitStreamVertex                 = 220,
    EndStreamPrimitive               = 221,
    ControlBarrier                   = 224,
    MemoryBarrier                    = 225,
    AtomicLoad                       = 227,
    AtomicStore                      = 228,
    AtomicExchange                   = 229,
    AtomicCompareExchange            = 230,
    AtomicCompareExchangeWeak        = 231,
    AtomicIIncrement                 = 232,
    AtomicIDecrement                 = 233,
    AtomicIAdd                       = 234,
    AtomicISub                       = 235,
    AtomicSMin                       = 236,
    AtomicUMin                       = 237,
    AtomicSMax                       = 238,
    AtomicUMax                       = 239,
    AtomicAnd                        = 240,
    AtomicOr                         = 241,
    AtomicXor                        = 242,
    Phi                              = 245,
    LoopMerge                        = 246,
    SelectionMerge                   = 247,
    Label                            = 248,
    Branch                           = 249,
    BranchConditional                = 250,
    Switch                           = 251,
    Kill                             = 252,
    Return                           = 253,
    ReturnValue                      = 254,
    Unreachable                      = 255,
    LifetimeStart                    = 256,
    LifetimeStop                     = 257,
    GroupAsyncCopy                   = 259,
    GroupWaitEvents                  = 260,
    GroupAll                         = 261,
    GroupAny                         = 262,
    GroupBroadcast                   = 263,
    GroupIAdd                        = 264,
    GroupFAdd                        = 265,
    GroupFMin                        = 266,
    GroupUMin                        = 267,
    GroupSMin                        = 268,
    GroupFMax                        = 269,
    GroupUMax                        = 270,
    GroupSMax                        = 271,
    ReadPipe                         = 274,
    WritePipe                        = 275,
    ReservedReadPipe                 = 276,
    ReservedWritePipe                = 277,
    ReserveReadPipePackets           = 278,
    ReserveWritePipePackets          = 279,
    CommitReadPipe                   = 280,
    CommitWritePipe                  = 281,
    IsValidReserveId                 = 282,
    GetNumPipePackets                = 283,
    GetMaxPipePackets                = 284,
    GroupReserveReadPipePackets      = 285,
    GroupReserveWritePipePackets     = 286,
    GroupCommitReadPipe              = 287,
    GroupCommitWritePipe             = 288,
    EnqueueMarker                    = 291,
    EnqueueKernel                    = 292,
    GetKernelNDrangeSubGroupCount    = 293,
    GetKernelNDrangeMaxSubGroupSize  = 294,
    GetKernelWorkGroupSize           = 295,
    GetKernelPreferredWorkGroupSizeMultiple = 296,
    RetainEvent                      = 297,
    ReleaseEvent                     = 298,
    CreateUserEvent                  = 299,
    IsValidEvent                     = 300,
    SetUserEventStatus               = 301,
    CaptureEventProfilingInfo        = 302,
    GetDefaultQueue                  = 303,
    BuildNDRange                     = 304,
    ImageSparseSampleImplicitLod     = 305,
    ImageSparseSampleExplicitLod     = 306,
    ImageSparseSampleDrefImplicitLod = 307,
    ImageSparseSampleDrefExplicitLod = 308,
    ImageSparseSampleProjImplicitLod = 309,
    ImageSparseSampleProjExplicitLod = 310,
    ImageSparseSampleProjDrefImplicitLod = 311,
    ImageSparseSampleProjDrefExplicitLod = 312,
    ImageSparseFetch                 = 313,
    ImageSparseGather                = 314,
    ImageSparseDrefGather            = 315,
    ImageSparseTexelsResident        = 316,
    NoLine                           = 317,
    AtomicFlagTestAndSet             = 318,
    AtomicFlagClear                  = 319,
    ImageSparseRead                  = 320,
    SizeOf                           = 321,
    TypePipeStorage                  = 322,
    ConstantPipeStorage              = 323,
    CreatePipeFromPipeStorage        = 324,
    GetKernelLocalSizeForSubgroupCount = 325,
    GetKernelMaxNumSubgroups         = 326,
    TypeNamedBarrier                 = 327,
    NamedBarrierInitialize           = 328,
    MemoryNamedBarrier               = 329,
    ModuleProcessed                  = 330,
    ExecutionModeId                  = 331,
    DecorateId                       = 332,
    GroupNonUniformElect             = 333,
    GroupNonUniformAll               = 334,
    GroupNonUniformAny               = 335,
    GroupNonUniformAllEqual          = 336,
    GroupNonUniformBroadcast         = 337,
    GroupNonUniformBroadcastFirst    = 338,
    GroupNonUniformBallot            = 339,
    GroupNonUniformInverseBallot     = 340,
    GroupNonUniformBallotBitExtract  = 341,
    GroupNonUniformBallotBitCount    = 342,
    GroupNonUniformBallotFindLSB     = 343,
    GroupNonUniformBallotFindMSB     = 344,
    GroupNonUniformShuffle           = 345,
    GroupNonUniformShuffleXor        = 346,
    GroupNonUniformShuffleUp         = 347,
    GroupNonUniformShuffleDown       = 348,
    GroupNonUniformIAdd              = 349,
    GroupNonUniformFAdd              = 350,
    GroupNonUniformIMul              = 351,
    GroupNonUniformFMul              = 352,
    GroupNonUniformSMin              = 353,
    GroupNonUniformUMin              = 354,
    GroupNonUniformFMin              = 355,
    GroupNonUniformSMax              = 356,
    GroupNonUniformUMax              = 357,
    GroupNonUniformFMax              = 358,
    GroupNonUniformBitwiseAnd        = 359,
    GroupNonUniformBitwiseOr         = 360,
    GroupNonUniformBitwiseXor        = 361,
    GroupNonUniformLogicalAnd        = 362,
    GroupNonUniformLogicalOr         = 363,
    GroupNonUniformLogicalXor        = 364,
    GroupNonUniformQuadBroadcast     = 365,
    GroupNonUniformQuadSwap          = 366,
    CopyLogical                      = 400,
    PtrEqual                         = 401,
    PtrNotEqual                      = 402,
    PtrDiff                          = 403,
    ColorAttachmentReadEXT           = 4160,
    DepthAttachmentReadEXT           = 4161,
    StencilAttachmentReadEXT         = 4162,
    TerminateInvocation              = 4416,
    SubgroupBallotKHR                = 4421,
    SubgroupFirstInvocationKHR       = 4422,
    SubgroupAllKHR                   = 4428,
    SubgroupAnyKHR                   = 4429,
    SubgroupAllEqualKHR              = 4430,
    GroupNonUniformRotateKHR         = 4431,
    SubgroupReadInvocationKHR        = 4432,
    TraceRayKHR                      = 4445,
    ExecuteCallableKHR               = 4446,
    ConvertUToAccelerationStructureKHR = 4447,
    IgnoreIntersectionKHR            = 4448,
    TerminateRayKHR                  = 4449,
    SDot                             = 4450,
    SDotKHR                          = 4450,
    UDot                             = 4451,
    UDotKHR                          = 4451,
    SUDot                            = 4452,
    SUDotKHR                         = 4452,
    SDotAccSat                       = 4453,
    SDotAccSatKHR                    = 4453,
    UDotAccSat                       = 4454,
    UDotAccSatKHR                    = 4454,
    SUDotAccSat                      = 4455,
    SUDotAccSatKHR                   = 4455,
    TypeCooperativeMatrixKHR         = 4456,
    CooperativeMatrixLoadKHR         = 4457,
    CooperativeMatrixStoreKHR        = 4458,
    CooperativeMatrixMulAddKHR       = 4459,
    CooperativeMatrixLengthKHR       = 4460,
    TypeRayQueryKHR                  = 4472,
    RayQueryInitializeKHR            = 4473,
    RayQueryTerminateKHR             = 4474,
    RayQueryGenerateIntersectionKHR  = 4475,
    RayQueryConfirmIntersectionKHR   = 4476,
    RayQueryProceedKHR               = 4477,
    RayQueryGetIntersectionTypeKHR   = 4479,
    ImageSampleWeightedQCOM          = 4480,
    ImageBoxFilterQCOM               = 4481,
    ImageBlockMatchSSDQCOM           = 4482,
    ImageBlockMatchSADQCOM           = 4483,
    GroupIAddNonUniformAMD           = 5000,
    GroupFAddNonUniformAMD           = 5001,
    GroupFMinNonUniformAMD           = 5002,
    GroupUMinNonUniformAMD           = 5003,
    GroupSMinNonUniformAMD           = 5004,
    GroupFMaxNonUniformAMD           = 5005,
    GroupUMaxNonUniformAMD           = 5006,
    GroupSMaxNonUniformAMD           = 5007,
    FragmentMaskFetchAMD             = 5011,
    FragmentFetchAMD                 = 5012,
    ReadClockKHR                     = 5056,
    HitObjectRecordHitMotionNV       = 5249,
    HitObjectRecordHitWithIndexMotionNV = 5250,
    HitObjectRecordMissMotionNV      = 5251,
    HitObjectGetWorldToObjectNV      = 5252,
    HitObjectGetObjectToWorldNV      = 5253,
    HitObjectGetObjectRayDirectionNV = 5254,
    HitObjectGetObjectRayOriginNV    = 5255,
    HitObjectTraceRayMotionNV        = 5256,
    HitObjectGetShaderRecordBufferHandleNV = 5257,
    HitObjectGetShaderBindingTableRecordIndexNV = 5258,
    HitObjectRecordEmptyNV           = 5259,
    HitObjectTraceRayNV              = 5260,
    HitObjectRecordHitNV             = 5261,
    HitObjectRecordHitWithIndexNV    = 5262,
    HitObjectRecordMissNV            = 5263,
    HitObjectExecuteShaderNV         = 5264,
    HitObjectGetCurrentTimeNV        = 5265,
    HitObjectGetAttributesNV         = 5266,
    HitObjectGetHitKindNV            = 5267,
    HitObjectGetPrimitiveIndexNV     = 5268,
    HitObjectGetGeometryIndexNV      = 5269,
    HitObjectGetInstanceIdNV         = 5270,
    HitObjectGetInstanceCustomIndexNV = 5271,
    HitObjectGetWorldRayDirectionNV  = 5272,
    HitObjectGetWorldRayOriginNV     = 5273,
    HitObjectGetRayTMaxNV            = 5274,
    HitObjectGetRayTMinNV            = 5275,
    HitObjectIsEmptyNV               = 5276,
    HitObjectIsHitNV                 = 5277,
    HitObjectIsMissNV                = 5278,
    ReorderThreadWithHitObjectNV     = 5279,
    ReorderThreadWithHintNV          = 5280,
    TypeHitObjectNV                  = 5281,
    ImageSampleFootprintNV           = 5283,
    EmitMeshTasksEXT                 = 5294,
    SetMeshOutputsEXT                = 5295,
    GroupNonUniformPartitionNV       = 5296,
    WritePackedPrimitiveIndices4x8NV = 5299,
    ReportIntersectionKHR            = 5334,
    ReportIntersectionNV             = 5334,
    IgnoreIntersectionNV             = 5335,
    TerminateRayNV                   = 5336,
    TraceNV                          = 5337,
    TraceMotionNV                    = 5338,
    TraceRayMotionNV                 = 5339,
    RayQueryGetIntersectionTriangleVertexPositionsKHR = 5340,
    TypeAccelerationStructureKHR     = 5341,
    TypeAccelerationStructureNV      = 5341,
    ExecuteCallableNV                = 5344,
    TypeCooperativeMatrixNV          = 5358,
    CooperativeMatrixLoadNV          = 5359,
    CooperativeMatrixStoreNV         = 5360,
    CooperativeMatrixMulAddNV        = 5361,
    CooperativeMatrixLengthNV        = 5362,
    BeginInvocationInterlockEXT      = 5364,
    EndInvocationInterlockEXT        = 5365,
    DemoteToHelperInvocation         = 5380,
    DemoteToHelperInvocationEXT      = 5380,
    IsHelperInvocationEXT            = 5381,
    ConvertUToImageNV                = 5391,
    ConvertUToSamplerNV              = 5392,
    ConvertImageToUNV                = 5393,
    ConvertSamplerToUNV              = 5394,
    ConvertUToSampledImageNV         = 5395,
    ConvertSampledImageToUNV         = 5396,
    SamplerImageAddressingModeNV     = 5397,
    SubgroupShuffleINTEL             = 5571,
    SubgroupShuffleDownINTEL         = 5572,
    SubgroupShuffleUpINTEL           = 5573,
    SubgroupShuffleXorINTEL          = 5574,
    SubgroupBlockReadINTEL           = 5575,
    SubgroupBlockWriteINTEL          = 5576,
    SubgroupImageBlockReadINTEL      = 5577,
    SubgroupImageBlockWriteINTEL     = 5578,
    SubgroupImageMediaBlockReadINTEL = 5580,
    SubgroupImageMediaBlockWriteINTEL = 5581,
    UCountLeadingZerosINTEL          = 5585,
    UCountTrailingZerosINTEL         = 5586,
    AbsISubINTEL                     = 5587,
    AbsUSubINTEL                     = 5588,
    IAddSatINTEL                     = 5589,
    UAddSatINTEL                     = 5590,
    IAverageINTEL                    = 5591,
    UAverageINTEL                    = 5592,
    IAverageRoundedINTEL             = 5593,
    UAverageRoundedINTEL             = 5594,
    ISubSatINTEL                     = 5595,
    USubSatINTEL                     = 5596,
    IMul32x16INTEL                   = 5597,
    UMul32x16INTEL                   = 5598,
    ConstantFunctionPointerINTEL     = 5600,
    FunctionPointerCallINTEL         = 5601,
    AsmTargetINTEL                   = 5609,
    AsmINTEL                         = 5610,
    AsmCallINTEL                     = 5611,
    AtomicFMinEXT                    = 5614,
    AtomicFMaxEXT                    = 5615,
    AssumeTrueKHR                    = 5630,
    ExpectKHR                        = 5631,
    DecorateString                   = 5632,
    DecorateStringGOOGLE             = 5632,
    MemberDecorateString             = 5633,
    MemberDecorateStringGOOGLE       = 5633,
    VmeImageINTEL                    = 5699,
    TypeVmeImageINTEL                = 5700,
    TypeAvcImePayloadINTEL           = 5701,
    TypeAvcRefPayloadINTEL           = 5702,
    TypeAvcSicPayloadINTEL           = 5703,
    TypeAvcMcePayloadINTEL           = 5704,
    TypeAvcMceResultINTEL            = 5705,
    TypeAvcImeResultINTEL            = 5706,
    TypeAvcImeResultSingleReferenceStreamoutINTEL = 5707,
    TypeAvcImeResultDualReferenceStreamoutINTEL = 5708,
    TypeAvcImeSingleReferenceStreaminINTEL = 5709,
    TypeAvcImeDualReferenceStreaminINTEL = 5710,
    TypeAvcRefResultINTEL            = 5711,
    TypeAvcSicResultINTEL            = 5712,
    SubgroupAvcMceGetDefaultInterBaseMultiReferencePenaltyINTEL = 5713,
    SubgroupAvcMceSetInterBaseMultiReferencePenaltyINTEL = 5714,
    SubgroupAvcMceGetDefaultInterShapePenaltyINTEL = 5715,
    SubgroupAvcMceSetInterShapePenaltyINTEL = 5716,
    SubgroupAvcMceGetDefaultInterDirectionPenaltyINTEL = 5717,
    SubgroupAvcMceSetInterDirectionPenaltyINTEL = 5718,
    SubgroupAvcMceGetDefaultIntraLumaShapePenaltyINTEL = 5719,
    SubgroupAvcMceGetDefaultInterMotionVectorCostTableINTEL = 5720,
    SubgroupAvcMceGetDefaultHighPenaltyCostTableINTEL = 5721,
    SubgroupAvcMceGetDefaultMediumPenaltyCostTableINTEL = 5722,
    SubgroupAvcMceGetDefaultLowPenaltyCostTableINTEL = 5723,
    SubgroupAvcMceSetMotionVectorCostFunctionINTEL = 5724,
    SubgroupAvcMceGetDefaultIntraLumaModePenaltyINTEL = 5725,
    SubgroupAvcMceGetDefaultNonDcLumaIntraPenaltyINTEL = 5726,
    SubgroupAvcMceGetDefaultIntraChromaModeBasePenaltyINTEL = 5727,
    SubgroupAvcMceSetAcOnlyHaarINTEL = 5728,
    SubgroupAvcMceSetSourceInterlacedFieldPolarityINTEL = 5729,
    SubgroupAvcMceSetSingleReferenceInterlacedFieldPolarityINTEL = 5730,
    SubgroupAvcMceSetDualReferenceInterlacedFieldPolaritiesINTEL = 5731,
    SubgroupAvcMceConvertToImePayloadINTEL = 5732,
    SubgroupAvcMceConvertToImeResultINTEL = 5733,
    SubgroupAvcMceConvertToRefPayloadINTEL = 5734,
    SubgroupAvcMceConvertToRefResultINTEL = 5735,
    SubgroupAvcMceConvertToSicPayloadINTEL = 5736,
    SubgroupAvcMceConvertToSicResultINTEL = 5737,
    SubgroupAvcMceGetMotionVectorsINTEL = 5738,
    SubgroupAvcMceGetInterDistortionsINTEL = 5739,
    SubgroupAvcMceGetBestInterDistortionsINTEL = 5740,
    SubgroupAvcMceGetInterMajorShapeINTEL = 5741,
    SubgroupAvcMceGetInterMinorShapeINTEL = 5742,
    SubgroupAvcMceGetInterDirectionsINTEL = 5743,
    SubgroupAvcMceGetInterMotionVectorCountINTEL = 5744,
    SubgroupAvcMceGetInterReferenceIdsINTEL = 5745,
    SubgroupAvcMceGetInterReferenceInterlacedFieldPolaritiesINTEL = 5746,
    SubgroupAvcImeInitializeINTEL    = 5747,
    SubgroupAvcImeSetSingleReferenceINTEL = 5748,
    SubgroupAvcImeSetDualReferenceINTEL = 5749,
    SubgroupAvcImeRefWindowSizeINTEL = 5750,
    SubgroupAvcImeAdjustRefOffsetINTEL = 5751,
    SubgroupAvcImeConvertToMcePayloadINTEL = 5752,
    SubgroupAvcImeSetMaxMotionVectorCountINTEL = 5753,
    SubgroupAvcImeSetUnidirectionalMixDisableINTEL = 5754,
    SubgroupAvcImeSetEarlySearchTerminationThresholdINTEL = 5755,
    SubgroupAvcImeSetWeightedSadINTEL = 5756,
    SubgroupAvcImeEvaluateWithSingleReferenceINTEL = 5757,
    SubgroupAvcImeEvaluateWithDualReferenceINTEL = 5758,
    SubgroupAvcImeEvaluateWithSingleReferenceStreaminINTEL = 5759,
    SubgroupAvcImeEvaluateWithDualReferenceStreaminINTEL = 5760,
    SubgroupAvcImeEvaluateWithSingleReferenceStreamoutINTEL = 5761,
    SubgroupAvcImeEvaluateWithDualReferenceStreamoutINTEL = 5762,
    SubgroupAvcImeEvaluateWithSingleReferenceStreaminoutINTEL = 5763,
    SubgroupAvcImeEvaluateWithDualReferenceStreaminoutINTEL = 5764,
    SubgroupAvcImeConvertToMceResultINTEL = 5765,
    SubgroupAvcImeGetSingleReferenceStreaminINTEL = 5766,
    SubgroupAvcImeGetDualReferenceStreaminINTEL = 5767,
    SubgroupAvcImeStripSingleReferenceStreamoutINTEL = 5768,
    SubgroupAvcImeStripDualReferenceStreamoutINTEL = 5769,
    SubgroupAvcImeGetStreamoutSingleReferenceMajorShapeMotionVectorsINTEL = 5770,
    SubgroupAvcImeGetStreamoutSingleReferenceMajorShapeDistortionsINTEL = 5771,
    SubgroupAvcImeGetStreamoutSingleReferenceMajorShapeReferenceIdsINTEL = 5772,
    SubgroupAvcImeGetStreamoutDualReferenceMajorShapeMotionVectorsINTEL = 5773,
    SubgroupAvcImeGetStreamoutDualReferenceMajorShapeDistortionsINTEL = 5774,
    SubgroupAvcImeGetStreamoutDualReferenceMajorShapeReferenceIdsINTEL = 5775,
    SubgroupAvcImeGetBorderReachedINTEL = 5776,
    SubgroupAvcImeGetTruncatedSearchIndicationINTEL = 5777,
    SubgroupAvcImeGetUnidirectionalEarlySearchTerminationINTEL = 5778,
    SubgroupAvcImeGetWeightingPatternMinimumMotionVectorINTEL = 5779,
    SubgroupAvcImeGetWeightingPatternMinimumDistortionINTEL = 5780,
    SubgroupAvcFmeInitializeINTEL    = 5781,
    SubgroupAvcBmeInitializeINTEL    = 5782,
    SubgroupAvcRefConvertToMcePayloadINTEL = 5783,
    SubgroupAvcRefSetBidirectionalMixDisableINTEL = 5784,
    SubgroupAvcRefSetBilinearFilterEnableINTEL = 5785,
    SubgroupAvcRefEvaluateWithSingleReferenceINTEL = 5786,
    SubgroupAvcRefEvaluateWithDualReferenceINTEL = 5787,
    SubgroupAvcRefEvaluateWithMultiReferenceINTEL = 5788,
    SubgroupAvcRefEvaluateWithMultiReferenceInterlacedINTEL = 5789,
    SubgroupAvcRefConvertToMceResultINTEL = 5790,
    SubgroupAvcSicInitializeINTEL    = 5791,
    SubgroupAvcSicConfigureSkcINTEL  = 5792,
    SubgroupAvcSicConfigureIpeLumaINTEL = 5793,
    SubgroupAvcSicConfigureIpeLumaChromaINTEL = 5794,
    SubgroupAvcSicGetMotionVectorMaskINTEL = 5795,
    SubgroupAvcSicConvertToMcePayloadINTEL = 5796,
    SubgroupAvcSicSetIntraLumaShapePenaltyINTEL = 5797,
    SubgroupAvcSicSetIntraLumaModeCostFunctionINTEL = 5798,
    SubgroupAvcSicSetIntraChromaModeCostFunctionINTEL = 5799,
    SubgroupAvcSicSetBilinearFilterEnableINTEL = 5800,
    SubgroupAvcSicSetSkcForwardTransformEnableINTEL = 5801,
    SubgroupAvcSicSetBlockBasedRawSkipSadINTEL = 5802,
    SubgroupAvcSicEvaluateIpeINTEL   = 5803,
    SubgroupAvcSicEvaluateWithSingleReferenceINTEL = 5804,
    SubgroupAvcSicEvaluateWithDualReferenceINTEL = 5805,
    SubgroupAvcSicEvaluateWithMultiReferenceINTEL = 5806,
    SubgroupAvcSicEvaluateWithMultiReferenceInterlacedINTEL = 5807,
    SubgroupAvcSicConvertToMceResultINTEL = 5808,
    SubgroupAvcSicGetIpeLumaShapeINTEL = 5809,
    SubgroupAvcSicGetBestIpeLumaDistortionINTEL = 5810,
    SubgroupAvcSicGetBestIpeChromaDistortionINTEL = 5811,
    SubgroupAvcSicGetPackedIpeLumaModesINTEL = 5812,
    SubgroupAvcSicGetIpeChromaModeINTEL = 5813,
    SubgroupAvcSicGetPackedSkcLumaCountThresholdINTEL = 5814,
    SubgroupAvcSicGetPackedSkcLumaSumThresholdINTEL = 5815,
    SubgroupAvcSicGetInterRawSadsINTEL = 5816,
    VariableLengthArrayINTEL         = 5818,
    SaveMemoryINTEL                  = 5819,
    RestoreMemoryINTEL               = 5820,
    ArbitraryFloatSinCosPiINTEL      = 5840,
    ArbitraryFloatCastINTEL          = 5841,
    ArbitraryFloatCastFromIntINTEL   = 5842,
    ArbitraryFloatCastToIntINTEL     = 5843,
    ArbitraryFloatAddINTEL           = 5846,
    ArbitraryFloatSubINTEL           = 5847,
    ArbitraryFloatMulINTEL           = 5848,
    ArbitraryFloatDivINTEL           = 5849,
    ArbitraryFloatGTINTEL            = 5850,
    ArbitraryFloatGEINTEL            = 5851,
    ArbitraryFloatLTINTEL            = 5852,
    ArbitraryFloatLEINTEL            = 5853,
    ArbitraryFloatEQINTEL            = 5854,
    ArbitraryFloatRecipINTEL         = 5855,
    ArbitraryFloatRSqrtINTEL         = 5856,
    ArbitraryFloatCbrtINTEL          = 5857,
    ArbitraryFloatHypotINTEL         = 5858,
    ArbitraryFloatSqrtINTEL          = 5859,
    ArbitraryFloatLogINTEL           = 5860,
    ArbitraryFloatLog2INTEL          = 5861,
    ArbitraryFloatLog10INTEL         = 5862,
    ArbitraryFloatLog1pINTEL         = 5863,
    ArbitraryFloatExpINTEL           = 5864,
    ArbitraryFloatExp2INTEL          = 5865,
    ArbitraryFloatExp10INTEL         = 5866,
    ArbitraryFloatExpm1INTEL         = 5867,
    ArbitraryFloatSinINTEL           = 5868,
    ArbitraryFloatCosINTEL           = 5869,
    ArbitraryFloatSinCosINTEL        = 5870,
    ArbitraryFloatSinPiINTEL         = 5871,
    ArbitraryFloatCosPiINTEL         = 5872,
    ArbitraryFloatASinINTEL          = 5873,
    ArbitraryFloatASinPiINTEL        = 5874,
    ArbitraryFloatACosINTEL          = 5875,
    ArbitraryFloatACosPiINTEL        = 5876,
    ArbitraryFloatATanINTEL          = 5877,
    ArbitraryFloatATanPiINTEL        = 5878,
    ArbitraryFloatATan2INTEL         = 5879,
    ArbitraryFloatPowINTEL           = 5880,
    ArbitraryFloatPowRINTEL          = 5881,
    ArbitraryFloatPowNINTEL          = 5882,
    LoopControlINTEL                 = 5887,
    AliasDomainDeclINTEL             = 5911,
    AliasScopeDeclINTEL              = 5912,
    AliasScopeListDeclINTEL          = 5913,
    FixedSqrtINTEL                   = 5923,
    FixedRecipINTEL                  = 5924,
    FixedRsqrtINTEL                  = 5925,
    FixedSinINTEL                    = 5926,
    FixedCosINTEL                    = 5927,
    FixedSinCosINTEL                 = 5928,
    FixedSinPiINTEL                  = 5929,
    FixedCosPiINTEL                  = 5930,
    FixedSinCosPiINTEL               = 5931,
    FixedLogINTEL                    = 5932,
    FixedExpINTEL                    = 5933,
    PtrCastToCrossWorkgroupINTEL     = 5934,
    CrossWorkgroupCastToPtrINTEL     = 5938,
    ReadPipeBlockingINTEL            = 5946,
    WritePipeBlockingINTEL           = 5947,
    FPGARegINTEL                     = 5949,
    RayQueryGetRayTMinKHR            = 6016,
    RayQueryGetRayFlagsKHR           = 6017,
    RayQueryGetIntersectionTKHR      = 6018,
    RayQueryGetIntersectionInstanceCustomIndexKHR = 6019,
    RayQueryGetIntersectionInstanceIdKHR = 6020,
    RayQueryGetIntersectionInstanceShaderBindingTableRecordOffsetKHR = 6021,
    RayQueryGetIntersectionGeometryIndexKHR = 6022,
    RayQueryGetIntersectionPrimitiveIndexKHR = 6023,
    RayQueryGetIntersectionBarycentricsKHR = 6024,
    RayQueryGetIntersectionFrontFaceKHR = 6025,
    RayQueryGetIntersectionCandidateAABBOpaqueKHR = 6026,
    RayQueryGetIntersectionObjectRayDirectionKHR = 6027,
    RayQueryGetIntersectionObjectRayOriginKHR = 6028,
    RayQueryGetWorldRayDirectionKHR  = 6029,
    RayQueryGetWorldRayOriginKHR     = 6030,
    RayQueryGetIntersectionObjectToWorldKHR = 6031,
    RayQueryGetIntersectionWorldToObjectKHR = 6032,
    AtomicFAddEXT                    = 6035,
    TypeBufferSurfaceINTEL           = 6086,
    TypeStructContinuedINTEL         = 6090,
    ConstantCompositeContinuedINTEL  = 6091,
    SpecConstantCompositeContinuedINTEL = 6092,
    ConvertFToBF16INTEL              = 6116,
    ConvertBF16ToFINTEL              = 6117,
    ControlBarrierArriveINTEL        = 6142,
    ControlBarrierWaitINTEL          = 6143,
    GroupIMulKHR                     = 6401,
    GroupFMulKHR                     = 6402,
    GroupBitwiseAndKHR               = 6403,
    GroupBitwiseOrKHR                = 6404,
    GroupBitwiseXorKHR               = 6405,
    GroupLogicalAndKHR               = 6406,
    GroupLogicalOrKHR                = 6407,
    GroupLogicalXorKHR               = 6408,
    Max                              = 2147483647,
}

/// SpvReflectResult
Result :: enum cffi.uint {
    SUCCESS                          = 0,
    NOT_READY                        = 1,
    ERROR_PARSE_FAILED               = 2,
    ERROR_ALLOC_FAILED               = 3,
    ERROR_RANGE_EXCEEDED             = 4,
    ERROR_NULL_POINTER               = 5,
    ERROR_INTERNAL_ERROR             = 6,
    ERROR_COUNT_MISMATCH             = 7,
    ERROR_ELEMENT_NOT_FOUND          = 8,
    ERROR_SPIRV_INVALID_CODE_SIZE    = 9,
    ERROR_SPIRV_INVALID_MAGIC_NUMBER = 10,
    ERROR_SPIRV_UNEXPECTED_EOF       = 11,
    ERROR_SPIRV_INVALID_ID_REFERENCE = 12,
    ERROR_SPIRV_SET_NUMBER_OVERFLOW  = 13,
    ERROR_SPIRV_INVALID_STORAGE_CLASS = 14,
    ERROR_SPIRV_RECURSION            = 15,
    ERROR_SPIRV_INVALID_INSTRUCTION  = 16,
    ERROR_SPIRV_UNEXPECTED_BLOCK_DATA = 17,
    ERROR_SPIRV_INVALID_BLOCK_MEMBER_REFERENCE = 18,
    ERROR_SPIRV_INVALID_ENTRY_POINT  = 19,
    ERROR_SPIRV_INVALID_EXECUTION_MODE = 20,
    ERROR_SPIRV_MAX_RECURSIVE_EXCEEDED = 21,
}

/// SpvReflectModuleFlagBits
ModuleFlag :: enum cffi.uint {
    _COPY = 0,
}
ModuleFlagBits :: bit_set[ModuleFlag; cffi.uint]

/// SpvReflectTypeFlagBits
TypeFlag :: enum cffi.uint {
    VOID                            = 0,
    BOOL                            = 1,
    INT                             = 2,
    FLOAT                           = 3,
    VECTOR                          = 8,
    MATRIX                          = 9,
    EXTERNAL_IMAGE                  = 16,
    EXTERNAL_SAMPLER                = 17,
    EXTERNAL_SAMPLED_IMAGE          = 18,
    EXTERNAL_BLOCK                  = 19,
    EXTERNAL_ACCELERATION_STRUCTURE = 20,
    STRUCT                          = 28,
    ARRAY                           = 29,
    REF                             = 30,
}
TypeFlagBits :: bit_set[TypeFlag; cffi.uint]

/// SpvReflectDecorationFlagBits
DecorationFlag :: enum cffi.uint {
    BLOCK               = 0,
    BUFFER_BLOCK        = 1,
    ROW_MAJOR           = 2,
    COLUMN_MAJOR        = 3,
    BUILT_IN            = 4,
    NOPERSPECTIVE       = 5,
    FLAT                = 6,
    NON_WRITABLE        = 7,
    RELAXED_PRECISION   = 8,
    NON_READABLE        = 9,
    PATCH               = 10,
    PER_VERTEX          = 11,
    PER_TASK            = 12,
    WEIGHT_TEXTURE      = 13,
    BLOCK_MATCH_TEXTURE = 14,
}
DecorationFlagBits :: bit_set[DecorationFlag; cffi.uint]

/// SpvReflectUserType
UserType :: enum cffi.uint {
    INVALID                          = 0,
    CBUFFER                          = 1,
    TBUFFER                          = 2,
    APPEND_STRUCTURED_BUFFER         = 3,
    BUFFER                           = 4,
    BYTE_ADDRESS_BUFFER              = 5,
    CONSTANT_BUFFER                  = 6,
    CONSUME_STRUCTURED_BUFFER        = 7,
    INPUT_PATCH                      = 8,
    OUTPUT_PATCH                     = 9,
    RASTERIZER_ORDERED_BUFFER        = 10,
    RASTERIZER_ORDERED_BYTE_ADDRESS_BUFFER = 11,
    RASTERIZER_ORDERED_STRUCTURED_BUFFER = 12,
    RASTERIZER_ORDERED_TEXTURE_1D    = 13,
    RASTERIZER_ORDERED_TEXTURE_1D_ARRAY = 14,
    RASTERIZER_ORDERED_TEXTURE_2D    = 15,
    RASTERIZER_ORDERED_TEXTURE_2D_ARRAY = 16,
    RASTERIZER_ORDERED_TEXTURE_3D    = 17,
    RAYTRACING_ACCELERATION_STRUCTURE = 18,
    RW_BUFFER                        = 19,
    RW_BYTE_ADDRESS_BUFFER           = 20,
    RW_STRUCTURED_BUFFER             = 21,
    RW_TEXTURE_1D                    = 22,
    RW_TEXTURE_1D_ARRAY              = 23,
    RW_TEXTURE_2D                    = 24,
    RW_TEXTURE_2D_ARRAY              = 25,
    RW_TEXTURE_3D                    = 26,
    STRUCTURED_BUFFER                = 27,
    SUBPASS_INPUT                    = 28,
    SUBPASS_INPUT_MS                 = 29,
    TEXTURE_1D                       = 30,
    TEXTURE_1D_ARRAY                 = 31,
    TEXTURE_2D                       = 32,
    TEXTURE_2D_ARRAY                 = 33,
    TEXTURE_2DMS                     = 34,
    TEXTURE_2DMS_ARRAY               = 35,
    TEXTURE_3D                       = 36,
    TEXTURE_BUFFER                   = 37,
    TEXTURE_CUBE                     = 38,
    TEXTURE_CUBE_ARRAY               = 39,
}

/// SpvReflectResourceType
ResourceType :: enum cffi.uint {
    UNDEFINED = 0,
    SAMPLER   = 1,
    CBV       = 2,
    SRV       = 4,
    UAV       = 8,
}

/// SpvReflectFormat
Format :: enum cffi.uint {
    UNDEFINED           = 0,
    R16_UINT            = 74,
    R16_SINT            = 75,
    R16_SFLOAT          = 76,
    R16G16_UINT         = 81,
    R16G16_SINT         = 82,
    R16G16_SFLOAT       = 83,
    R16G16B16_UINT      = 88,
    R16G16B16_SINT      = 89,
    R16G16B16_SFLOAT    = 90,
    R16G16B16A16_UINT   = 95,
    R16G16B16A16_SINT   = 96,
    R16G16B16A16_SFLOAT = 97,
    R32_UINT            = 98,
    R32_SINT            = 99,
    R32_SFLOAT          = 100,
    R32G32_UINT         = 101,
    R32G32_SINT         = 102,
    R32G32_SFLOAT       = 103,
    R32G32B32_UINT      = 104,
    R32G32B32_SINT      = 105,
    R32G32B32_SFLOAT    = 106,
    R32G32B32A32_UINT   = 107,
    R32G32B32A32_SINT   = 108,
    R32G32B32A32_SFLOAT = 109,
    R64_UINT            = 110,
    R64_SINT            = 111,
    R64_SFLOAT          = 112,
    R64G64_UINT         = 113,
    R64G64_SINT         = 114,
    R64G64_SFLOAT       = 115,
    R64G64B64_UINT      = 116,
    R64G64B64_SINT      = 117,
    R64G64B64_SFLOAT    = 118,
    R64G64B64A64_UINT   = 119,
    R64G64B64A64_SINT   = 120,
    R64G64B64A64_SFLOAT = 121,
}

/// SpvReflectDescriptorType
DescriptorType :: enum cffi.uint {
    SAMPLER                    = 0,
    COMBINED_IMAGE_SAMPLER     = 1,
    SAMPLED_IMAGE              = 2,
    STORAGE_IMAGE              = 3,
    UNIFORM_TEXEL_BUFFER       = 4,
    STORAGE_TEXEL_BUFFER       = 5,
    UNIFORM_BUFFER             = 6,
    STORAGE_BUFFER             = 7,
    UNIFORM_BUFFER_DYNAMIC     = 8,
    STORAGE_BUFFER_DYNAMIC     = 9,
    INPUT_ATTACHMENT           = 10,
    ACCELERATION_STRUCTURE_KHR = 1000150000,
}

/// SpvReflectShaderStageFlagBits
ShaderStageFlag :: enum cffi.uint {
    VERTEX_BIT                  = 0,
    TESSELLATION_CONTROL_BIT    = 1,
    TESSELLATION_EVALUATION_BIT = 2,
    GEOMETRY_BIT                = 3,
    FRAGMENT_BIT                = 4,
    COMPUTE_BIT                 = 5,
    TASK_BIT_NV                 = 6,
    TASK_BIT_EXT                = 6,
    MESH_BIT_NV                 = 7,
    MESH_BIT_EXT                = 7,
    RAYGEN_BIT_KHR              = 8,
    ANY_HIT_BIT_KHR             = 9,
    CLOSEST_HIT_BIT_KHR         = 10,
    MISS_BIT_KHR                = 11,
    INTERSECTION_BIT_KHR        = 12,
    CALLABLE_BIT_KHR            = 13,
}
ShaderStageFlagBits :: bit_set[ShaderStageFlag; cffi.uint]

/// SpvReflectGenerator
Generator :: enum cffi.uint {
    KHRONOS_LLVM_SPIRV_TRANSLATOR    = 6,
    KHRONOS_SPIRV_TOOLS_ASSEMBLER    = 7,
    KHRONOS_GLSLANG_REFERENCE_FRONT_END = 8,
    GOOGLE_SHADERC_OVER_GLSLANG      = 13,
    GOOGLE_SPIREGG                   = 14,
    GOOGLE_RSPIRV                    = 15,
    X_LEGEND_MESA_MESAIR_SPIRV_TRANSLATOR = 16,
    KHRONOS_SPIRV_TOOLS_LINKER       = 17,
    WINE_VKD3D_SHADER_COMPILER       = 18,
    CLAY_CLAY_SHADER_COMPILER        = 19,
}

/// SpvReflectArrayDimType
ArrayDimType :: enum cffi.uint {
    REFLECT_ARRAY_DIM_RUNTIME = 0,
}

/// SpvReflectExecutionModeValue
ExecutionModeValue :: enum cffi.uint {
    REFLECT_EXECUTION_MODE_SPEC_CONSTANT = 4294967295,
}

/// SpvReflectVariableFlagBits
VariableFlag :: enum cffi.uint {
    UNUSED                = 0,
    PHYSICAL_POINTER_COPY = 1,
}
VariableFlagBits :: bit_set[VariableFlag; cffi.uint]

/// SpvReflectNumericTraits
NumericTraits :: struct #align (4) {
    scalar:  Scalar,
    vector:  Vector,
    _matrix: Matrix,
}
#assert(size_of(NumericTraits) == 24)

/// SpvReflectNumericTraits::Scalar
Scalar :: struct #align (4) {
    width:      cffi.uint32_t,
    signedness: cffi.uint32_t,
}
#assert(size_of(Scalar) == 8)

/// SpvReflectNumericTraits::Vector
Vector :: struct #align (4) {
    component_count: cffi.uint32_t,
}
#assert(size_of(Vector) == 4)

/// SpvReflectNumericTraits::Matrix
Matrix :: struct #align (4) {
    column_count: cffi.uint32_t,
    row_count:    cffi.uint32_t,
    stride:       cffi.uint32_t,
}
#assert(size_of(Matrix) == 12)

/// SpvReflectImageTraits
ImageTraits :: struct #align (4) {
    dim:          SpvDim,
    depth:        cffi.uint32_t,
    arrayed:      cffi.uint32_t,
    ms:           cffi.uint32_t,
    sampled:      cffi.uint32_t,
    image_format: SpvImageFormat,
}
#assert(size_of(ImageTraits) == 24)

/// SpvReflectArrayTraits
ArrayTraits :: struct #align (4) {
    dims_count:           cffi.uint32_t,
    dims:                 [32]cffi.uint32_t,
    spec_constant_op_ids: [32]cffi.uint32_t,
    stride:               cffi.uint32_t,
}
#assert(size_of(ArrayTraits) == 264)

/// SpvReflectBindingArrayTraits
BindingArrayTraits :: struct #align (4) {
    dims_count: cffi.uint32_t,
    dims:       [32]cffi.uint32_t,
}
#assert(size_of(BindingArrayTraits) == 132)

/// SpvReflectTypeDescription
TypeDescription :: struct #align (8) {
    id:                      cffi.uint32_t,
    op:                      SpvOp,
    type_name:               cstring,
    struct_member_name:      cstring,
    storage_class:           cffi.int,
    type_flags:              TypeFlags,
    decoration_flags:        DecorationFlags,
    traits:                  Traits,
    struct_type_description: ^TypeDescription,
    copied:                  cffi.uint32_t,
    member_count:            cffi.uint32_t,
    members:                 ^TypeDescription,
}
#assert(size_of(TypeDescription) == 376)

/// SpvReflectTypeDescription::Traits
Traits :: struct #align (4) {
    numeric: NumericTraits,
    image:   ImageTraits,
    array:   ArrayTraits,
}
#assert(size_of(Traits) == 312)

/// SpvReflectInterfaceVariable
InterfaceVariable :: struct #align (8) {
    spirv_id:         cffi.uint32_t,
    name:             cstring,
    location:         cffi.uint32_t,
    component:        cffi.uint32_t,
    storage_class:    SpvStorageClass,
    semantic:         cstring,
    decoration_flags: DecorationFlags,
    built_in:         cffi.int,
    numeric:          NumericTraits,
    array:            ArrayTraits,
    member_count:     cffi.uint32_t,
    members:          ^InterfaceVariable,
    format:           Format,
    type_description: ^TypeDescription,
    word_offset : struct  {
        location:         cffi.uint32_t,
    },
}
#assert(size_of(InterfaceVariable) == 376)

/// SpvReflectBlockVariable
BlockVariable :: struct #align (8) {
    spirv_id:         cffi.uint32_t,
    name:             cstring,
    offset:           cffi.uint32_t,
    absolute_offset:  cffi.uint32_t,
    size:             cffi.uint32_t,
    padded_size:      cffi.uint32_t,
    decoration_flags: DecorationFlags,
    numeric:          NumericTraits,
    array:            ArrayTraits,
    flags:            VariableFlags,
    member_count:     cffi.uint32_t,
    members:          ^BlockVariable,
    type_description: ^TypeDescription,
    word_offset : struct  {
        offset:           cffi.uint32_t,
    },
}
#assert(size_of(BlockVariable) == 360)

/// SpvReflectDescriptorBinding
DescriptorBinding :: struct #align (8) {
    spirv_id:                        cffi.uint32_t,
    name:                            cstring,
    binding:                         cffi.uint32_t,
    input_attachment_index:          cffi.uint32_t,
    set:                             cffi.uint32_t,
    descriptor_type:                 DescriptorType,
    resource_type:                   ResourceType,
    image:                           ImageTraits,
    block:                           BlockVariable,
    array:                           BindingArrayTraits,
    count:                           cffi.uint32_t,
    accessed:                        cffi.uint32_t,
    uav_counter_id:                  cffi.uint32_t,
    uav_counter_binding:             ^DescriptorBinding,
    byte_address_buffer_offset_count: cffi.uint32_t,
    byte_address_buffer_offsets:     ^cffi.uint32_t,
    type_description:                ^TypeDescription,
    word_offset : struct  {
        binding:                         cffi.uint32_t,
        set:                             cffi.uint32_t,
    },
    decoration_flags:                DecorationFlags,
    user_type:                       UserType,
}
#assert(size_of(DescriptorBinding) == 616)

/// SpvReflectDescriptorSet
DescriptorSet :: struct #align (8) {
    set:           cffi.uint32_t,
    binding_count: cffi.uint32_t,
    bindings:      ^^DescriptorBinding,
}
#assert(size_of(DescriptorSet) == 16)

/// SpvReflectEntryPoint
EntryPoint :: struct #align (8) {
    name:                     cstring,
    id:                       cffi.uint32_t,
    spirv_execution_model:    SpvExecutionModel,
    shader_stage:             ShaderStageFlagBits,
    input_variable_count:     cffi.uint32_t,
    input_variables:          ^^InterfaceVariable,
    output_variable_count:    cffi.uint32_t,
    output_variables:         ^^InterfaceVariable,
    interface_variable_count: cffi.uint32_t,
    interface_variables:      ^InterfaceVariable,
    descriptor_set_count:     cffi.uint32_t,
    descriptor_sets:          ^DescriptorSet,
    used_uniform_count:       cffi.uint32_t,
    used_uniforms:            ^cffi.uint32_t,
    used_push_constant_count: cffi.uint32_t,
    used_push_constants:      ^cffi.uint32_t,
    execution_mode_count:     cffi.uint32_t,
    execution_modes:          ^SpvExecutionMode,
    local_size:               LocalSize,
    invocations:              cffi.uint32_t,
    output_vertices:          cffi.uint32_t,
}
#assert(size_of(EntryPoint) == 152)

/// SpvReflectEntryPoint::LocalSize
LocalSize :: struct #align (4) {
    x: cffi.uint32_t,
    y: cffi.uint32_t,
    z: cffi.uint32_t,
}
#assert(size_of(LocalSize) == 12)

/// SpvReflectCapability
Capability :: struct #align (4) {
    value:       SpvCapability,
    word_offset: cffi.uint32_t,
}
#assert(size_of(Capability) == 8)

/// SpvReflectSpecializationConstant
SpecializationConstant :: struct #align (8) {
    spirv_id:    cffi.uint32_t,
    constant_id: cffi.uint32_t,
    name:        cstring,
}
#assert(size_of(SpecializationConstant) == 16)

/// SpvReflectShaderModule
ShaderModule :: struct #align (8) {
    generator:                 Generator,
    entry_point_name:          cstring,
    entry_point_id:            cffi.uint32_t,
    entry_point_count:         cffi.uint32_t,
    entry_points:              ^EntryPoint,
    source_language:           SpvSourceLanguage,
    source_language_version:   cffi.uint32_t,
    source_file:               cstring,
    source_source:             cstring,
    capability_count:          cffi.uint32_t,
    capabilities:              ^Capability,
    spirv_execution_model:     SpvExecutionModel,
    shader_stage:              ShaderStageFlagBits,
    descriptor_binding_count:  cffi.uint32_t,
    descriptor_bindings:       ^DescriptorBinding,
    descriptor_set_count:      cffi.uint32_t,
    descriptor_sets:           [64]DescriptorSet,
    input_variable_count:      cffi.uint32_t,
    input_variables:           ^^InterfaceVariable,
    output_variable_count:     cffi.uint32_t,
    output_variables:          ^^InterfaceVariable,
    interface_variable_count:  cffi.uint32_t,
    interface_variables:       ^InterfaceVariable,
    push_constant_block_count: cffi.uint32_t,
    push_constant_blocks:      ^BlockVariable,
    spec_constant_count:       cffi.uint32_t,
    spec_constants:            ^SpecializationConstant,
    _internal:                 ^Internal,
}
#assert(size_of(ShaderModule) == 1216)

/// SpvReflectShaderModule::Internal
Internal :: struct #align (8) {
    module_flags:           ModuleFlags,
    spirv_size:             cffi.size_t,
    spirv_code:             ^cffi.uint32_t,
    spirv_word_count:       cffi.uint32_t,
    type_description_count: cffi.size_t,
    type_descriptions:      ^TypeDescription,
}
#assert(size_of(Internal) == 48)

