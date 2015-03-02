#include "../fixtures/util.hpp"

#include <mbgl/util/mapbox.hpp>

using namespace mbgl;

TEST(Mapbox, SourceURL) {
    EXPECT_EQ(mbgl::util::mapbox::normalizeSourceURL("mapbox://user.map", "key"), "https://api.tiles.mapbox.com/v4/user.map.json?access_token=key");
    EXPECT_EQ(mbgl::util::mapbox::normalizeSourceURL("mapbox://user.map", "token"), "https://api.tiles.mapbox.com/v4/user.map.json?access_token=token");
    EXPECT_THROW(mbgl::util::mapbox::normalizeSourceURL("mapbox://user.map", ""), std::runtime_error);
}

TEST(Mapbox, GlyphsURL) {
    EXPECT_EQ(mbgl::util::mapbox::normalizeGlyphsURL("mapbox://fontstack/{fontstack}/{range}.pbf", "key"), "https://api.tiles.mapbox.com/v4/fontstack/{fontstack}/{range}.pbf?access_token=key");
    EXPECT_EQ(mbgl::util::mapbox::normalizeGlyphsURL("http://path", "key"), "http://path");
}

TEST(Mapbox, TileURL) {
    EXPECT_EQ(mbgl::util::mapbox::normalizeTileURL("http://path.png/tile.png", "mapbox://user.map"), "http://path.png/tile{ratio}.png");
    EXPECT_EQ(mbgl::util::mapbox::normalizeTileURL("http://path.png/tile.png32", "mapbox://user.map"), "http://path.png/tile{ratio}.png32");
    EXPECT_EQ(mbgl::util::mapbox::normalizeTileURL("http://path.png/tile.png70", "mapbox://user.map"), "http://path.png/tile{ratio}.png70");
    EXPECT_EQ(mbgl::util::mapbox::normalizeTileURL("http://path.png/tile.png?access_token=foo", "mapbox://user.map"), "http://path.png/tile{ratio}.png?access_token=foo");
    EXPECT_EQ(mbgl::util::mapbox::normalizeTileURL("http://path.png", "http://path"), "http://path.png");
    EXPECT_EQ(mbgl::util::mapbox::normalizeTileURL("http://path.png", ""), "http://path.png");
}
