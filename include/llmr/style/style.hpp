#ifndef LLMR_STYLE_STYLE
#define LLMR_STYLE_STYLE

#include <map>
#include <vector>
#include <set>
#include "../util/pbf.hpp"

#include "value.hpp"
#include "properties.hpp"
#include "bucket_description.hpp"
#include "layer_description.hpp"
#include "class_description.hpp"

namespace llmr {

class Style {
public:
    Style();

    void reset();
    void load(const uint8_t *const data, uint32_t bytes);

    void cascade(float z);

private:
    static std::pair<std::string, BucketDescription> parseBucket(pbf data);
    static LayerDescription parseLayer(pbf data);
    static std::pair<std::string, ClassDescription> parseClass(pbf data);
    static std::pair<std::string, FillClass> parseFillClass(pbf data);
    static std::pair<std::string, StrokeClass> parseStrokeClass(pbf data);
    template <typename T> static FunctionProperty<T> parseProperty(pbf data);
    static Color parseColor(pbf& data);

public:
    // This is static information parsed from the stylesheet.
    std::map<std::string, BucketDescription> buckets;
    std::vector<LayerDescription> layers;
    std::map<std::string, ClassDescription> classes;


    // This are applied settings.
    std::set<std::string> appliedClasses;
    struct {
        std::map<std::string, FillProperties> fills;
        std::map<std::string, StrokeProperties> strokes;
    } computed;
};

}



#endif