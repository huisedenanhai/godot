#ifndef RENDERING_DEVICE_METAL_H
#define RENDERING_DEVICE_METAL_H

#include "servers/rendering/rendering_device.h"

class RenderingDeviceMetal : public RenderingDevice {
public:
	RenderingDeviceMetal();
	~RenderingDeviceMetal();

	virtual RID texture_create(const TextureFormat &p_format, const TextureView &p_view, const Vector<Vector<uint8_t>> &p_data = Vector<Vector<uint8_t>>());
	virtual RID texture_create_shared(const TextureView &p_view, RID p_with_texture);
	virtual RID texture_create_from_extension(TextureType p_type, DataFormat p_format, TextureSamples p_samples, uint64_t p_flags, uint64_t p_image, uint64_t p_width, uint64_t p_height, uint64_t p_depth, uint64_t p_layers);
	virtual RID texture_create_shared_from_slice(const TextureView &p_view, RID p_with_texture, uint32_t p_layer, uint32_t p_mipmap, uint32_t p_mipmaps = 1, TextureSliceType p_slice_type = TEXTURE_SLICE_2D, uint32_t p_layers = 0);

	virtual Error texture_update(RID p_texture, uint32_t p_layer, const Vector<uint8_t> &p_data, BitField<BarrierMask> p_post_barrier = BARRIER_MASK_ALL_BARRIERS);
	virtual Vector<uint8_t> texture_get_data(RID p_texture, uint32_t p_layer); // CPU textures will return immediately, while GPU textures will most likely force a flush

	virtual bool texture_is_format_supported_for_usage(DataFormat p_format, BitField<RenderingDevice::TextureUsageBits> p_usage) const;
	virtual bool texture_is_shared(RID p_texture);
	virtual bool texture_is_valid(RID p_texture);
	virtual Size2i texture_size(RID p_texture);
	virtual uint64_t texture_get_native_handle(RID p_texture);

	virtual Error texture_copy(RID p_from_texture, RID p_to_texture, const Vector3 &p_from, const Vector3 &p_to, const Vector3 &p_size, uint32_t p_src_mipmap, uint32_t p_dst_mipmap, uint32_t p_src_layer, uint32_t p_dst_layer, BitField<BarrierMask> p_post_barrier = BARRIER_MASK_ALL_BARRIERS);
	virtual Error texture_clear(RID p_texture, const Color &p_color, uint32_t p_base_mipmap, uint32_t p_mipmaps, uint32_t p_base_layer, uint32_t p_layers, BitField<BarrierMask> p_post_barrier = BARRIER_MASK_ALL_BARRIERS);
	virtual Error texture_resolve_multisample(RID p_from_texture, RID p_to_texture, BitField<BarrierMask> p_post_barrier = BARRIER_MASK_ALL_BARRIERS);

	/*********************/
	/**** FRAMEBUFFER ****/
	/*********************/

	virtual FramebufferFormatID framebuffer_format_create(const Vector<AttachmentFormat> &p_format, uint32_t p_view_count = 1);
	virtual FramebufferFormatID framebuffer_format_create_multipass(const Vector<AttachmentFormat> &p_attachments, const Vector<FramebufferPass> &p_passes, uint32_t p_view_count = 1);
	virtual FramebufferFormatID framebuffer_format_create_empty(TextureSamples p_samples = TEXTURE_SAMPLES_1);
	virtual TextureSamples framebuffer_format_get_texture_samples(FramebufferFormatID p_format, uint32_t p_pass = 0);

	virtual RID framebuffer_create(const Vector<RID> &p_texture_attachments, FramebufferFormatID p_format_check = INVALID_ID, uint32_t p_view_count = 1);
	virtual RID framebuffer_create_multipass(const Vector<RID> &p_texture_attachments, const Vector<FramebufferPass> &p_passes, FramebufferFormatID p_format_check = INVALID_ID, uint32_t p_view_count = 1);
	virtual RID framebuffer_create_empty(const Size2i &p_size, TextureSamples p_samples = TEXTURE_SAMPLES_1, FramebufferFormatID p_format_check = INVALID_ID);
	virtual bool framebuffer_is_valid(RID p_framebuffer) const;
	virtual void framebuffer_set_invalidation_callback(RID p_framebuffer, InvalidationCallback p_callback, void *p_userdata);

	virtual FramebufferFormatID framebuffer_get_format(RID p_framebuffer);

	/*****************/
	/**** SAMPLER ****/
	/*****************/

	virtual RID sampler_create(const SamplerState &p_state);
	virtual bool sampler_is_format_supported_for_filter(DataFormat p_format, SamplerFilter p_sampler_filter) const;

	/**********************/
	/**** VERTEX ARRAY ****/
	/**********************/

	virtual RID vertex_buffer_create(uint32_t p_size_bytes, const Vector<uint8_t> &p_data = Vector<uint8_t>(), bool p_use_as_storage = false);

	// Internally reference counted, this ID is warranted to be unique for the same description, but needs to be freed as many times as it was allocated.
	virtual VertexFormatID vertex_format_create(const Vector<VertexAttribute> &p_vertex_formats);
	virtual RID vertex_array_create(uint32_t p_vertex_count, VertexFormatID p_vertex_format, const Vector<RID> &p_src_buffers, const Vector<uint64_t> &p_offsets = Vector<uint64_t>());

	virtual RID index_buffer_create(uint32_t p_size_indices, IndexBufferFormat p_format, const Vector<uint8_t> &p_data = Vector<uint8_t>(), bool p_use_restart_indices = false);

	virtual RID index_array_create(RID p_index_buffer, uint32_t p_index_offset, uint32_t p_index_count);

	/****************/
	/**** SHADER ****/
	/****************/

	virtual String shader_get_binary_cache_key() const;
	virtual Vector<uint8_t> shader_compile_binary_from_spirv(const Vector<ShaderStageSPIRVData> &p_spirv, const String &p_shader_name = "");

	virtual RID shader_create_from_bytecode(const Vector<uint8_t> &p_shader_binary);

	virtual uint32_t shader_get_vertex_input_attribute_mask(RID p_shader);

	/*****************/
	/**** UNIFORM ****/
	/*****************/

	virtual RID uniform_buffer_create(uint32_t p_size_bytes, const Vector<uint8_t> &p_data = Vector<uint8_t>());
	virtual RID storage_buffer_create(uint32_t p_size_bytes, const Vector<uint8_t> &p_data = Vector<uint8_t>(), BitField<StorageBufferUsage> p_usage = 0);
	virtual RID texture_buffer_create(uint32_t p_size_elements, DataFormat p_format, const Vector<uint8_t> &p_data = Vector<uint8_t>());

	virtual RID uniform_set_create(const Vector<Uniform> &p_uniforms, RID p_shader, uint32_t p_shader_set);
	virtual bool uniform_set_is_valid(RID p_uniform_set);
	virtual void uniform_set_set_invalidation_callback(RID p_uniform_set, InvalidationCallback p_callback, void *p_userdata);

	virtual Error buffer_update(RID p_buffer, uint32_t p_offset, uint32_t p_size, const void *p_data, BitField<BarrierMask> p_post_barrier = BARRIER_MASK_ALL_BARRIERS); // Works for any buffer.
	virtual Error buffer_clear(RID p_buffer, uint32_t p_offset, uint32_t p_size, BitField<BarrierMask> p_post_barrier = BARRIER_MASK_ALL_BARRIERS);
	virtual Vector<uint8_t> buffer_get_data(RID p_buffer, uint32_t p_offset = 0, uint32_t p_size = 0);

	/*************************/
	/**** RENDER PIPELINE ****/
	/*************************/

	virtual RID render_pipeline_create(RID p_shader, FramebufferFormatID p_framebuffer_format, VertexFormatID p_vertex_format, RenderPrimitive p_render_primitive, const PipelineRasterizationState &p_rasterization_state, const PipelineMultisampleState &p_multisample_state, const PipelineDepthStencilState &p_depth_stencil_state, const PipelineColorBlendState &p_blend_state, BitField<PipelineDynamicStateFlags> p_dynamic_state_flags = 0, uint32_t p_for_render_pass = 0, const Vector<PipelineSpecializationConstant> &p_specialization_constants = Vector<PipelineSpecializationConstant>());
	virtual bool render_pipeline_is_valid(RID p_pipeline);

	/**************************/
	/**** COMPUTE PIPELINE ****/
	/**************************/

	virtual RID compute_pipeline_create(RID p_shader, const Vector<PipelineSpecializationConstant> &p_specialization_constants = Vector<PipelineSpecializationConstant>());
	virtual bool compute_pipeline_is_valid(RID p_pipeline);

	/****************/
	/**** SCREEN ****/
	/****************/

	virtual int screen_get_width(DisplayServer::WindowID p_screen = 0) const;
	virtual int screen_get_height(DisplayServer::WindowID p_screen = 0) const;
	virtual FramebufferFormatID screen_get_framebuffer_format() const;

	/********************/
	/**** DRAW LISTS ****/
	/********************/

	virtual DrawListID draw_list_begin_for_screen(DisplayServer::WindowID p_screen = 0, const Color &p_clear_color = Color());

	virtual DrawListID draw_list_begin(RID p_framebuffer, InitialAction p_initial_color_action, FinalAction p_final_color_action, InitialAction p_initial_depth_action, FinalAction p_final_depth_action, const Vector<Color> &p_clear_color_values = Vector<Color>(), float p_clear_depth = 1.0, uint32_t p_clear_stencil = 0, const Rect2 &p_region = Rect2(), const Vector<RID> &p_storage_textures = Vector<RID>());
	virtual Error draw_list_begin_split(RID p_framebuffer, uint32_t p_splits, DrawListID *r_split_ids, InitialAction p_initial_color_action, FinalAction p_final_color_action, InitialAction p_initial_depth_action, FinalAction p_final_depth_action, const Vector<Color> &p_clear_color_values = Vector<Color>(), float p_clear_depth = 1.0, uint32_t p_clear_stencil = 0, const Rect2 &p_region = Rect2(), const Vector<RID> &p_storage_textures = Vector<RID>());

	virtual void draw_list_set_blend_constants(DrawListID p_list, const Color &p_color);
	virtual void draw_list_bind_render_pipeline(DrawListID p_list, RID p_render_pipeline);
	virtual void draw_list_bind_uniform_set(DrawListID p_list, RID p_uniform_set, uint32_t p_index);
	virtual void draw_list_bind_vertex_array(DrawListID p_list, RID p_vertex_array);
	virtual void draw_list_bind_index_array(DrawListID p_list, RID p_index_array);
	virtual void draw_list_set_line_width(DrawListID p_list, float p_width);
	virtual void draw_list_set_push_constant(DrawListID p_list, const void *p_data, uint32_t p_data_size);

	virtual void draw_list_draw(DrawListID p_list, bool p_use_indices, uint32_t p_instances = 1, uint32_t p_procedural_vertices = 0);

	virtual void draw_list_enable_scissor(DrawListID p_list, const Rect2 &p_rect);
	virtual void draw_list_disable_scissor(DrawListID p_list);

	virtual uint32_t draw_list_get_current_pass();
	virtual DrawListID draw_list_switch_to_next_pass();
	virtual Error draw_list_switch_to_next_pass_split(uint32_t p_splits, DrawListID *r_split_ids);

	virtual void draw_list_end(BitField<BarrierMask> p_post_barrier = BARRIER_MASK_ALL_BARRIERS);

	/***********************/
	/**** COMPUTE LISTS ****/
	/***********************/

	virtual ComputeListID compute_list_begin(bool p_allow_draw_overlap = false);
	virtual void compute_list_bind_compute_pipeline(ComputeListID p_list, RID p_compute_pipeline);
	virtual void compute_list_bind_uniform_set(ComputeListID p_list, RID p_uniform_set, uint32_t p_index);
	virtual void compute_list_set_push_constant(ComputeListID p_list, const void *p_data, uint32_t p_data_size);
	virtual void compute_list_add_barrier(ComputeListID p_list);

	virtual void compute_list_dispatch(ComputeListID p_list, uint32_t p_x_groups, uint32_t p_y_groups, uint32_t p_z_groups);
	virtual void compute_list_dispatch_threads(ComputeListID p_list, uint32_t p_x_threads, uint32_t p_y_threads, uint32_t p_z_threads);
	virtual void compute_list_dispatch_indirect(ComputeListID p_list, RID p_buffer, uint32_t p_offset);
	virtual void compute_list_end(BitField<BarrierMask> p_post_barrier = BARRIER_MASK_ALL_BARRIERS);

	virtual void barrier(BitField<BarrierMask> p_from = BARRIER_MASK_ALL_BARRIERS, BitField<BarrierMask> p_to = BARRIER_MASK_ALL_BARRIERS);
	virtual void full_barrier();

	/**************/
	/**** FREE ****/
	/**************/

	virtual void free(RID p_id);

	/****************/
	/**** Timing ****/
	/****************/

	virtual void capture_timestamp(const String &p_name);
	virtual uint32_t get_captured_timestamps_count() const;
	virtual uint64_t get_captured_timestamps_frame() const;
	virtual uint64_t get_captured_timestamp_gpu_time(uint32_t p_index) const;
	virtual uint64_t get_captured_timestamp_cpu_time(uint32_t p_index) const;
	virtual String get_captured_timestamp_name(uint32_t p_index) const;

	/****************/
	/**** Limits ****/
	/****************/

	virtual uint64_t limit_get(Limit p_limit) const;

	virtual void prepare_screen_for_drawing();
	virtual void swap_buffers(); // For main device.

	virtual void submit(); // For local device.
	virtual void sync(); // For local device.

	virtual uint32_t get_frame_delay() const;

	virtual RenderingDevice *create_local_device();

	virtual uint64_t get_memory_usage(MemoryType p_type) const;

	virtual void set_resource_name(RID p_id, const String p_name);

	virtual void draw_command_begin_label(String p_label_name, const Color p_color = Color(1, 1, 1, 1));
	virtual void draw_command_insert_label(String p_label_name, const Color p_color = Color(1, 1, 1, 1));
	virtual void draw_command_end_label();

	virtual String get_device_vendor_name() const;
	virtual String get_device_name() const;
	virtual RenderingDevice::DeviceType get_device_type() const;
	virtual String get_device_api_version() const;
	virtual String get_device_pipeline_cache_uuid() const;

	virtual uint64_t get_driver_resource(DriverResource p_resource, RID p_rid = RID(), uint64_t p_index = 0);

	virtual bool has_feature(const Features p_feature) const;

private:
};

#endif
