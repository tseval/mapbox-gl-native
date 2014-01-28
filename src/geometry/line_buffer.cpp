#include <llmr/geometry/line_buffer.hpp>
#include <llmr/platform/gl.hpp>
// #include <cmath>

using namespace llmr;

LineBuffer::~LineBuffer() {
    if (buffer != 0) {
        glDeleteBuffers(1, &buffer);
        buffer = 0;
    }
}

uint32_t LineBuffer::length() const {
    // We store 2 coordinates per vertex + 1 linesofar + 1 extrude coord pair == 4 (== 8 bytes)
    return array.size() / 4;
}

void LineBuffer::add(int16_t x, int16_t y, float ex, float ey, int8_t tx, int8_t ty, int32_t linesofar) {
    array.push_back((x * 2) | tx);
    array.push_back((y * 2) | ty);
    array.push_back(linesofar);
    array.push_back(
        ((int16_t)round(extrudeScale * ex) << 8) |
        ((int16_t)round(extrudeScale * ey) & 0xFF)
    );
    if (!dirty) dirty = true;
};

void LineBuffer::addDegenerate() {
    add(16383, 16383, 0, 0, 1, 1, 0);
}

void LineBuffer::bind() {
    if (buffer == 0) {
        glGenBuffers(1, &buffer);
    }

    glBindBuffer(GL_ARRAY_BUFFER, buffer);

    if (dirty) {
        glBufferData(GL_ARRAY_BUFFER, array.size() * sizeof(int16_t), array.data(), GL_STATIC_DRAW);
        dirty = false;
    }
}