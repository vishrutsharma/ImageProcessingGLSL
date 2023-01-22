#version 150

uniform vec2 resolution;
uniform float angle;
uniform float time;
uniform sampler2D texture0;

vec2 rotateUV(vec2 uv, float rotation)
{
    float pivot = 0.5;
    return vec2(
        cos(rotation) * (uv.x - pivot) - sin(rotation) * (uv.y - pivot) + pivot,
        cos(rotation) * (uv.y - pivot) + sin(rotation) * (uv.x - pivot) + pivot
    );
}


void main(void)
{
    vec2 uvSample = 1-gl_FragCoord.xy/resolution.xy;
    
    uvSample = rotateUV(uvSample,angle+time);
    vec3 color = texture2D(texture0,uvSample).rgb;
    
    gl_FragColor = vec4(vec3(color),1);
}