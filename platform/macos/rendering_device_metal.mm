#include "rendering_device_metal.h"

RenderingDeviceMetal::RenderingDeviceMetal() {}
RenderingDeviceMetal::~RenderingDeviceMetal() {}

#define TODO_RET(v) return v
#define TODO() \
	return {}
#define TODO_NO_RET() return

RID RenderingDeviceMetal::texture_create(const TextureFormat &p_format, const TextureView &p_view, const Vector<Vector<uint8_t>> &p_data) {
	TODO_RET({});
}

RID RenderingDeviceMetal::texture_create_shared(const TextureView &p_view, RID p_with_texture) {
	TODO_RET({});
}

RID RenderingDeviceMetal::texture_create_from_extension(TextureType p_type, DataFormat p_format, TextureSamples p_samples, uint64_t p_flags, uint64_t p_image, uint64_t p_width, uint64_t p_height, uint64_t p_depth, uint64_t p_layers) {
	TODO_RET({});
}

RID RenderingDeviceMetal::texture_create_shared_from_slice(const TextureView &p_view, RID p_with_texture, uint32_t p_layer, uint32_t p_mipmap, uint32_t p_mipmaps, TextureSliceType p_slice_type, uint32_t p_layers) {
	TODO_RET({});
}

Error RenderingDeviceMetal::texture_update(RID p_texture, uint32_t p_layer, const Vector<uint8_t> &p_data, BitField<BarrierMask> p_post_barrier) {
	TODO_RET({});
}

Vector<uint8_t> RenderingDeviceMetal::texture_get_data(RID p_texture, uint32_t p_layer) {
	TODO_RET({});
}

bool RenderingDeviceMetal::texture_is_format_supported_for_usage(DataFormat p_format, BitField<RenderingDevice::TextureUsageBits> p_usage) const {
	TODO_RET({});
}

bool RenderingDeviceMetal::texture_is_shared(RID p_texture) {
	TODO_RET({});
}

bool RenderingDeviceMetal::texture_is_valid(RID p_texture) {
	TODO_RET({});
}

Size2i RenderingDeviceMetal::texture_size(RID p_texture) {
	TODO_RET({});
}

uint64_t RenderingDeviceMetal::texture_get_native_handle(RID p_texture) {
	TODO_RET({});
}

Error RenderingDeviceMetal::texture_copy(RID p_from_texture, RID p_to_texture, const Vector3 &p_from, const Vector3 &p_to, const Vector3 &p_size, uint32_t p_src_mipmap, uint32_t p_dst_mipmap, uint32_t p_src_layer, uint32_t p_dst_layer, BitField<BarrierMask> p_post_barrier) {
	TODO_RET({});
}

Error RenderingDeviceMetal::texture_clear(RID p_texture, const Color &p_color, uint32_t p_base_mipmap, uint32_t p_mipmaps, uint32_t p_base_layer, uint32_t p_layers, BitField<BarrierMask> p_post_barrier) {
	TODO_RET({});
}

Error RenderingDeviceMetal::texture_resolve_multisample(RID p_from_texture, RID p_to_texture, BitField<BarrierMask> p_post_barrier) {
	TODO_RET({});
}

RenderingDevice::FramebufferFormatID RenderingDeviceMetal::framebuffer_format_create(const Vector<AttachmentFormat> &p_format, uint32_t p_view_count) {
	TODO_RET({});
}

RenderingDevice::FramebufferFormatID RenderingDeviceMetal::framebuffer_format_create_multipass(const Vector<AttachmentFormat> &p_attachments, const Vector<FramebufferPass> &p_passes, uint32_t p_view_count) {
	TODO();
}

RenderingDevice::FramebufferFormatID RenderingDeviceMetal::framebuffer_format_create_empty(TextureSamples p_samples) {
	TODO();
}

RenderingDevice::TextureSamples RenderingDeviceMetal::framebuffer_format_get_texture_samples(FramebufferFormatID p_format, uint32_t p_pass) {
	TODO();
}

RID RenderingDeviceMetal::framebuffer_create(const Vector<RID> &p_texture_attachments, FramebufferFormatID p_format_check, uint32_t p_view_count) {
	TODO();
}

RID RenderingDeviceMetal::framebuffer_create_multipass(const Vector<RID> &p_texture_attachments, const Vector<FramebufferPass> &p_passes, FramebufferFormatID p_format_check, uint32_t p_view_count) {
	TODO();
}

RID RenderingDeviceMetal::framebuffer_create_empty(const Size2i &p_size, TextureSamples p_samples, FramebufferFormatID p_format_check) {
	TODO();
}

bool RenderingDeviceMetal::framebuffer_is_valid(RID p_framebuffer) const {
	TODO();
}

void RenderingDeviceMetal::framebuffer_set_invalidation_callback(RID p_framebuffer, InvalidationCallback p_callback, void *p_userdata) {
	TODO_NO_RET();
}

RenderingDevice::FramebufferFormatID RenderingDeviceMetal::framebuffer_get_format(RID p_framebuffer) {
	TODO();
}

RID RenderingDeviceMetal::sampler_create(const SamplerState &p_state) {
	TODO();
}

bool RenderingDeviceMetal::sampler_is_format_supported_for_filter(DataFormat p_format, SamplerFilter p_sampler_filter) const {
	TODO();
}

RID RenderingDeviceMetal::vertex_buffer_create(uint32_t p_size_bytes, const Vector<uint8_t> &p_data, bool p_use_as_storage) {
	TODO();
}

RenderingDevice::VertexFormatID RenderingDeviceMetal::vertex_format_create(const Vector<VertexAttribute> &p_vertex_formats) {
	TODO();
}

RID RenderingDeviceMetal::vertex_array_create(uint32_t p_vertex_count, VertexFormatID p_vertex_format, const Vector<RID> &p_src_buffers, const Vector<uint64_t> &p_offsets) {
	TODO();
}

RID RenderingDeviceMetal::index_buffer_create(uint32_t p_size_indices, IndexBufferFormat p_format, const Vector<uint8_t> &p_data, bool p_use_restart_indices) {
	TODO();
}

RID RenderingDeviceMetal::index_array_create(RID p_index_buffer, uint32_t p_index_offset, uint32_t p_index_count) {
	TODO();
}

String RenderingDeviceMetal::shader_get_binary_cache_key() const {
	TODO();
}

Vector<uint8_t> RenderingDeviceMetal::shader_compile_binary_from_spirv(const Vector<ShaderStageSPIRVData> &p_spirv, const String &p_shader_name) {
	TODO();
}

RID RenderingDeviceMetal::shader_create_from_bytecode(const Vector<uint8_t> &p_shader_binary) {
	TODO();
}

uint32_t RenderingDeviceMetal::shader_get_vertex_input_attribute_mask(RID p_shader) {
	TODO();
}

RID RenderingDeviceMetal::uniform_buffer_create(uint32_t p_size_bytes, const Vector<uint8_t> &p_data) {
	TODO();
}

RID RenderingDeviceMetal::storage_buffer_create(uint32_t p_size_bytes, const Vector<uint8_t> &p_data, BitField<StorageBufferUsage> p_usage) {
	TODO();
}

RID RenderingDeviceMetal::texture_buffer_create(uint32_t p_size_elements, DataFormat p_format, const Vector<uint8_t> &p_data) {
	TODO();
}

RID RenderingDeviceMetal::uniform_set_create(const Vector<Uniform> &p_uniforms, RID p_shader, uint32_t p_shader_set) {
	TODO();
}

bool RenderingDeviceMetal::uniform_set_is_valid(RID p_uniform_set) {
	TODO();
}

void RenderingDeviceMetal::uniform_set_set_invalidation_callback(RID p_uniform_set, InvalidationCallback p_callback, void *p_userdata) {
	TODO_NO_RET();
}

Error RenderingDeviceMetal::buffer_update(RID p_buffer, uint32_t p_offset, uint32_t p_size, const void *p_data, BitField<BarrierMask> p_post_barrier) {
	TODO();
}

Error RenderingDeviceMetal::buffer_clear(RID p_buffer, uint32_t p_offset, uint32_t p_size, BitField<BarrierMask> p_post_barrier) {
	TODO();
}

Vector<uint8_t> RenderingDeviceMetal::buffer_get_data(RID p_buffer, uint32_t p_offset, uint32_t p_size) {
	TODO();
}

RID RenderingDeviceMetal::render_pipeline_create(RID p_shader, FramebufferFormatID p_framebuffer_format, VertexFormatID p_vertex_format, RenderPrimitive p_render_primitive, const PipelineRasterizationState &p_rasterization_state, const PipelineMultisampleState &p_multisample_state, const PipelineDepthStencilState &p_depth_stencil_state, const PipelineColorBlendState &p_blend_state, BitField<PipelineDynamicStateFlags> p_dynamic_state_flags, uint32_t p_for_render_pass, const Vector<PipelineSpecializationConstant> &p_specialization_constants) {
	TODO();
}

bool RenderingDeviceMetal::render_pipeline_is_valid(RID p_pipeline) {
	TODO();
}

RID RenderingDeviceMetal::compute_pipeline_create(RID p_shader, const Vector<PipelineSpecializationConstant> &p_specialization_constants) {
	TODO();
}

bool RenderingDeviceMetal::compute_pipeline_is_valid(RID p_pipeline) {
	TODO();
}

int RenderingDeviceMetal::screen_get_width(DisplayServer::WindowID p_screen) const {
	TODO();
}

int RenderingDeviceMetal::screen_get_height(DisplayServer::WindowID p_screen) const {
	TODO();
}

RenderingDevice::FramebufferFormatID RenderingDeviceMetal::screen_get_framebuffer_format() const {
	TODO();
}

RenderingDevice::DrawListID RenderingDeviceMetal::draw_list_begin_for_screen(DisplayServer::WindowID p_screen, const Color &p_clear_color) {
	TODO();
}

RenderingDevice::DrawListID RenderingDeviceMetal::draw_list_begin(RID p_framebuffer, InitialAction p_initial_color_action, FinalAction p_final_color_action, InitialAction p_initial_depth_action, FinalAction p_final_depth_action, const Vector<Color> &p_clear_color_values, float p_clear_depth, uint32_t p_clear_stencil, const Rect2 &p_region, const Vector<RID> &p_storage_textures) {
	TODO();
}

Error RenderingDeviceMetal::draw_list_begin_split(RID p_framebuffer, uint32_t p_splits, DrawListID *r_split_ids, InitialAction p_initial_color_action, FinalAction p_final_color_action, InitialAction p_initial_depth_action, FinalAction p_final_depth_action, const Vector<Color> &p_clear_color_values, float p_clear_depth, uint32_t p_clear_stencil, const Rect2 &p_region, const Vector<RID> &p_storage_textures) {
	TODO();
}

void RenderingDeviceMetal::draw_list_set_blend_constants(DrawListID p_list, const Color &p_color) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_list_bind_render_pipeline(DrawListID p_list, RID p_render_pipeline) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_list_bind_uniform_set(DrawListID p_list, RID p_uniform_set, uint32_t p_index) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_list_bind_vertex_array(DrawListID p_list, RID p_vertex_array) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_list_bind_index_array(DrawListID p_list, RID p_index_array) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_list_set_line_width(DrawListID p_list, float p_width) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_list_set_push_constant(DrawListID p_list, const void *p_data, uint32_t p_data_size) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_list_draw(DrawListID p_list, bool p_use_indices, uint32_t p_instances, uint32_t p_procedural_vertices) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_list_enable_scissor(DrawListID p_list, const Rect2 &p_rect) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_list_disable_scissor(DrawListID p_list) {
	TODO_NO_RET();
}

uint32_t RenderingDeviceMetal::draw_list_get_current_pass() {
	TODO();
}

RenderingDevice::DrawListID RenderingDeviceMetal::draw_list_switch_to_next_pass() {
	TODO();
}

Error RenderingDeviceMetal::draw_list_switch_to_next_pass_split(uint32_t p_splits, DrawListID *r_split_ids) {
	TODO();
}

void RenderingDeviceMetal::draw_list_end(BitField<BarrierMask> p_post_barrier) {
	TODO_NO_RET();
}

RenderingDevice::ComputeListID RenderingDeviceMetal::compute_list_begin(bool p_allow_draw_overlap) {
	TODO();
}

void RenderingDeviceMetal::compute_list_bind_compute_pipeline(ComputeListID p_list, RID p_compute_pipeline) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::compute_list_bind_uniform_set(ComputeListID p_list, RID p_uniform_set, uint32_t p_index) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::compute_list_set_push_constant(ComputeListID p_list, const void *p_data, uint32_t p_data_size) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::compute_list_add_barrier(ComputeListID p_list) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::compute_list_dispatch(ComputeListID p_list, uint32_t p_x_groups, uint32_t p_y_groups, uint32_t p_z_groups) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::compute_list_dispatch_threads(ComputeListID p_list, uint32_t p_x_threads, uint32_t p_y_threads, uint32_t p_z_threads) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::compute_list_dispatch_indirect(ComputeListID p_list, RID p_buffer, uint32_t p_offset) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::compute_list_end(BitField<BarrierMask> p_post_barrier) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::barrier(BitField<BarrierMask> p_from, BitField<BarrierMask> p_to) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::full_barrier() {
	TODO_NO_RET();
}

void RenderingDeviceMetal::free(RID p_id) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::capture_timestamp(const String &p_name) {
	TODO_NO_RET();
}

uint32_t RenderingDeviceMetal::get_captured_timestamps_count() const {
	TODO();
}

uint64_t RenderingDeviceMetal::get_captured_timestamps_frame() const {
	TODO();
}

uint64_t RenderingDeviceMetal::get_captured_timestamp_gpu_time(uint32_t p_index) const {
	TODO();
}

uint64_t RenderingDeviceMetal::get_captured_timestamp_cpu_time(uint32_t p_index) const {
	TODO();
}

String RenderingDeviceMetal::get_captured_timestamp_name(uint32_t p_index) const {
	TODO();
}

uint64_t RenderingDeviceMetal::limit_get(Limit p_limit) const {
	TODO();
}

void RenderingDeviceMetal::prepare_screen_for_drawing() {
	TODO_NO_RET();
}

void RenderingDeviceMetal::swap_buffers() {
	TODO_NO_RET();
}

void RenderingDeviceMetal::submit() {
	TODO_NO_RET();
}

void RenderingDeviceMetal::sync() {
	TODO_NO_RET();
}

uint32_t RenderingDeviceMetal::get_frame_delay() const {
	TODO();
}

RenderingDevice *RenderingDeviceMetal::create_local_device() {
	TODO();
}

uint64_t RenderingDeviceMetal::get_memory_usage(MemoryType p_type) const {
	TODO();
}

void RenderingDeviceMetal::set_resource_name(RID p_id, const String p_name) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_command_begin_label(String p_label_name, const Color p_color) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_command_insert_label(String p_label_name, const Color p_color) {
	TODO_NO_RET();
}

void RenderingDeviceMetal::draw_command_end_label() {
	TODO_NO_RET();
}

String RenderingDeviceMetal::get_device_vendor_name() const {
	TODO();
}

String RenderingDeviceMetal::get_device_name() const {
	TODO();
}

RenderingDevice::DeviceType RenderingDeviceMetal::get_device_type() const {
	TODO();
}

String RenderingDeviceMetal::get_device_api_version() const {
	TODO();
}

String RenderingDeviceMetal::get_device_pipeline_cache_uuid() const {
	TODO();
}

uint64_t RenderingDeviceMetal::get_driver_resource(DriverResource p_resource, RID p_rid, uint64_t p_index) {
	TODO();
}

bool RenderingDeviceMetal::has_feature(const Features p_feature) const {
	TODO();
}
