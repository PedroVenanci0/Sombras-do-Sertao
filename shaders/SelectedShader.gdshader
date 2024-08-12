shader_type canvas_item;

uniform vec4 line_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 base_color : source_color = vec4(1.0, 1.0, 1.0, 1.0); // Cor base quando não iluminado
uniform float line_thickness : hint_range(0, 10) = 1.0;
uniform bool hovered = false;

const vec2 OFFSETS[8] = {
    vec2(-1, -1), vec2(-1, 0), vec2(-1, 1), vec2(0, -1), vec2(0, 1), 
    vec2(1, -1), vec2(1, 0), vec2(1, 1)
};

void fragment() {
    vec2 size = TEXTURE_PIXEL_SIZE * line_thickness;
    float outline = 0.0;

    for (int i = 0; i < 8; i++) {
        outline += texture(TEXTURE, UV + size * OFFSETS[i]).a;
    }
    outline = min(outline, 1.0);

    vec4 color = texture(TEXTURE, UV);
    
    if (hovered) {
        COLOR = mix(base_color * color, line_color, outline - color.a);
    } else {
        // Use base_color for the object when not hovered
        vec4 albedo = base_color * color;
        COLOR = albedo;
    }
}
