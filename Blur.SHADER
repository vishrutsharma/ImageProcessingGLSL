#version 150

uniform vec2 resolution;
uniform sampler2D mainTexture;
out vec4 fragColor;

#define box_blur mat3(1, 1, 1, 1, 1, 1, 1, 1, 1) * 0.1111
#define gaussian_blur mat3(1, 2, 1, 2, 4, 2, 1, 2, 1) * 0.0825
#define emboss mat3(-2, -1, 0, -1, 1, 1, 0, 1, 2)

vec4 convolute(vec2 uv, mat3 kernel)
{
    vec4 color = vec4(0);
    
    const float direction[3] = float[3](-1.0, 0.0, 1.0);    
    for (int x = 0; x < 3; x++)
    {
        for (int y = 0; y < 3; y++)
        {
            vec2 offset = vec2(direction[x], direction[y]) / resolution.xy;
            color += texture(mainTexture, uv+offset) * kernel[x][y];
        }
    }
    return color;
}


void main(void)
{
    vec2 uv = 1-gl_FragCoord.xy / resolution.xy;
    fragColor = convolute(uv, box_blur);
}