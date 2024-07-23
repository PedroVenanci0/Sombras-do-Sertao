shader_type canvas_item;

uniform bool verific = false;
uniform vec4 line_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float line_thickness : hint_range(0.0, 10.0) = 1.0;

const vec2 OFFSETS[8] = {
    vec2(-1.0, -1.0), vec2(-1.0, 0.0), vec2(-1.0, 1.0), vec2(0.0, -1.0), 
    vec2(0.0, 1.0), vec2(1.0, -1.0), vec2(1.0, 0.0), vec2(1.0, 1.0)
};

void fragment() {
    vec4 color = texture(TEXTURE, UV);
    
    if (verific) {
        vec2 size = TEXTURE_PIXEL_SIZE * line_thickness;
        float outline = 0.0;
        
        for (int i = 0; i < OFFSETS.length(); i++) {
            outline += texture(TEXTURE, UV + size * OFFSETS[i]).a;
        }
        outline = min(outline, 1.0);
        
        vec4 color_full = mix(color, line_color, outline - color.a);
        //COLOR = color_full;
    } else {
        COLOR = color;
    }
}
