#include <llmr/geometry/fill_buffer.hpp>
#include <llmr/platform/gl.hpp>
// #include <cmath>

using namespace llmr;

fill_buffer::fill_buffer()
    : vertex_buffer(0),
      element_buffer(0),
      dirty(true) {

}

fill_buffer::~fill_buffer() {
    if (vertex_buffer != 0) {
        glDeleteBuffers(1, &vertex_buffer);
        vertex_buffer = 0;
    }
    if (element_buffer != 0) {
        glDeleteBuffers(1, &element_buffer);
        element_buffer = 0;
    }
}

uint32_t fill_buffer::vertex_length() const {
    // We store 2 coordinates per vertex
    return vertices.size() / 2;
}

uint32_t fill_buffer::elements_length() const {
    // A triangle has 3 indices
    return elements.size() / 3;
}

void fill_buffer::addDegenerate() {
    vertices.push_back(32767);
    vertices.push_back(0);
}

void fill_buffer::addCoordinate(int16_t x, int16_t y) {
    vertices.push_back(x);
    vertices.push_back(y);
}

void fill_buffer::addElements(uint16_t a, uint16_t b, uint16_t c) {
    elements.push_back(a);
    elements.push_back(b);
    elements.push_back(c);
}

void fill_buffer::bind() {
    if (vertex_buffer == 0) {
        glGenBuffers(1, &vertex_buffer);
        glBindBuffer(GL_ARRAY_BUFFER, vertex_buffer);
    } else {
        glBindBuffer(GL_ARRAY_BUFFER, vertex_buffer);
    }

    if (element_buffer == 0) {
        glGenBuffers(1, &element_buffer);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, element_buffer);
    } else {
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, element_buffer);
    }

    if (dirty) {
        glBufferData(GL_ARRAY_BUFFER, vertices.size() * sizeof(uint16_t), vertices.data(), GL_STATIC_DRAW);
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, elements.size() * sizeof(uint16_t), elements.data(), GL_STATIC_DRAW);
        dirty = false;
    }
}