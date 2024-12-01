shader_type spatial;

uniform vec4 color1 = vec4(1.0, 0.0, 0.125, 1.0); // Vermelho
uniform vec4 color2 = vec4(1.0, 0.0, 1.0, 1.0);   // Rosa

void fragment() {
    float gradient = UV.y; // Gradiente baseado na posição vertical (UV)
    vec3 interpolated_color = mix(color1.rgb, color2.rgb, gradient); // Interpolação linear
    ALBEDO = interpolated_color; // Define a cor do material
}