#-------------------------------------------------
#
# Project created by QtCreator 2015-03-03T10:16:41
#
#-------------------------------------------------

#QT       -= gui

TARGET = mbgl
TEMPLATE = lib
CONFIG += staticlib

include(../../mapbox-gl-native.pri)
CONFIG += c++11

INCLUDEPATH += $$MBGL_HOME/src

SOURCES += \
geometry/debug_font_buffer.cpp \
geometry/elements_buffer.cpp \
geometry/fill_buffer.cpp \
geometry/glyph_atlas.cpp \
geometry/icon_buffer.cpp \
geometry/line_atlas.cpp \
geometry/line_buffer.cpp \
geometry/resample.cpp \
geometry/sprite_atlas.cpp \
geometry/static_vertex_buffer.cpp \
geometry/text_buffer.cpp \
geometry/vao.cpp \

HEADERS += \
geometry/anchor.hpp \
geometry/binpack.hpp \
geometry/buffer.hpp \
geometry/debug_font_buffer.hpp \
geometry/debug_font_data.hpp \
geometry/elements_buffer.hpp \
geometry/fill_buffer.hpp \
geometry/geometry.hpp \
geometry/glyph_atlas.hpp \
geometry/icon_buffer.hpp \
geometry/line_atlas.hpp \
geometry/line_buffer.hpp \
geometry/resample.hpp \
geometry/sprite_atlas.hpp \
geometry/static_vertex_buffer.hpp \
geometry/text_buffer.hpp \
geometry/vao.hpp

SOURCES += \
map/map.cpp \
map/raster_tile_data.cpp \
map/source.cpp \
map/sprite.cpp \
map/tile.cpp \
map/tile_data.cpp \
map/tile_parser.cpp \
map/transform.cpp \
map/transform_state.cpp \
map/vector_tile.cpp \
map/vector_tile_data.cpp \

HEADERS += \
map/raster_tile_data.hpp \
map/source.hpp \
map/sprite.hpp \
map/tile_data.hpp \
map/tile_parser.hpp \
map/vector_tile.hpp \
map/vector_tile_data.hpp

SOURCES += \
   platform/gl.cpp \
   platform/log.cpp

SOURCES += \
   platform/gl.cpp \
   platform/log.cpp


SOURCES += \
renderer/debug_bucket.cpp \
renderer/fill_bucket.cpp \
renderer/frame_history.cpp \
renderer/line_bucket.cpp \
renderer/painter.cpp \
renderer/painter_clipping.cpp \
renderer/painter_debug.cpp \
renderer/painter_fill.cpp \
renderer/painter_line.cpp \
renderer/painter_raster.cpp \
renderer/painter_symbol.cpp \
renderer/raster_bucket.cpp \
renderer/symbol_bucket.cpp

HEADERS += \
renderer/bucket.hpp \
renderer/debug_bucket.hpp \
renderer/fill_bucket.hpp \
renderer/frame_history.hpp \
renderer/line_bucket.hpp \
renderer/painter.hpp \
renderer/raster_bucket.hpp \
renderer/symbol_bucket.hpp

SOURCES += \
shader/dot_shader.cpp \
shader/gaussian_shader.cpp \
shader/icon_shader.cpp \
shader/line_shader.cpp \
shader/linejoin_shader.cpp \
shader/linepattern_shader.cpp \
shader/linesdf_shader.cpp \
shader/outline_shader.cpp \
shader/pattern_shader.cpp \
shader/plain_shader.cpp \
shader/raster_shader.cpp \
shader/sdf_shader.cpp \
shader/shader.cpp \
shader/uniform.cpp

HEADERS += \
shader/dot_shader.hpp \
shader/gaussian_shader.hpp \
shader/icon_shader.hpp \
shader/line_shader.hpp \
shader/linejoin_shader.hpp \
shader/linepattern_shader.hpp \
shader/linesdf_shader.hpp \
shader/outline_shader.hpp \
shader/pattern_shader.hpp \
shader/plain_shader.hpp \
shader/raster_shader.hpp \
shader/sdf_shader.hpp \
shader/shader.hpp \
shader/uniform.hpp

SOURCES += \
storage/default_file_source.cpp \
storage/network_status.cpp \
storage/request.cpp

SOURCES += \
style/applied_class_properties.cpp \
style/class_dictionary.cpp \
style/class_properties.cpp \
style/filter_expression.cpp \
style/function_properties.cpp \
style/piecewisefunction_properties.cpp \
style/property_fallback.cpp \
style/style.cpp \
style/style_layer.cpp \
style/style_layer_group.cpp \
style/style_layout.cpp \
style/style_parser.cpp \
style/style_properties.cpp \
style/style_source.cpp \
style/types.cpp \
style/value.cpp

HEADERS += \
style/applied_class_properties.hpp \
style/class_dictionary.hpp \
style/class_properties.hpp \
style/filter_expression.hpp \
style/filter_expression_private.hpp \
style/function_properties.hpp \
style/piecewisefunction_properties.hpp \
style/property_fallback.hpp \
style/property_key.hpp \
style/property_transition.hpp \
style/property_value.hpp \
style/style.hpp \
style/style_bucket.hpp \
style/style_layer.hpp \
style/style_layer_group.hpp \
style/style_layout.hpp \
style/style_parser.hpp \
style/style_properties.hpp \
style/style_source.hpp \
style/types.hpp \
style/value.hpp \
style/value_comparison.hpp \
style/zoom_history.hpp

SOURCES += \
text/collision.cpp \
text/glyph.cpp \
text/glyph_store.cpp \
text/placement.cpp \
text/rotation_range.cpp

HEADERS += \
text/collision.hpp \
text/glyph.hpp \
text/glyph_store.hpp \
text/placement.hpp \
text/rotation_range.hpp \
text/types.hpp

SOURCES += \
   util/clip_ids.cpp \
   util/constants.cpp \
   util/io.cpp \
   util/mapbox.cpp \
   util/mat3.cpp \
   util/mat4.cpp \
   util/math.cpp \
   util/merge_lines.cpp \
   util/raster.cpp \
   util/stopwatch.cpp \
   util/texture_pool.cpp \
   util/time.cpp \
   util/transition.cpp \
   util/url.cpp \
   util/uv.cpp \
   util/version_info.cpp

HEADERS += \
   util/queue.h \
   util/uv-channel.h \
   util/uv-worker.h \
   util/box.hpp \
   util/clip_ids.hpp \
   util/error.hpp \
   util/interpolate.hpp \
   util/io.hpp \
   util/mapbox.hpp \
   util/mat3.hpp \
   util/merge_lines.hpp \
   util/optional.hpp \
   util/pbf.hpp \
   util/raster.hpp \
   util/rect.hpp \
   util/stopwatch.hpp \
   util/texture_pool.hpp \
   util/token.hpp \
   util/transition.hpp \
   util/unitbezier.hpp \
   util/url.hpp \
   util/utf.hpp \
   util/uv_detail.hpp

OTHER_FILES += \
   shader/*.glsl

unix {
    target.path = /usr/lib
    INSTALLS += target
}
