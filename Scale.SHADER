#version 150

uniform vec2 resolution;
uniform float scale;
uniform sampler2D texture0;


void main(void)
{
    vec2 uvSample = 1-gl_FragCoord.xy/resolution.xy;
    
    uvSample = (uvSample - 0.5) * scale + (0.5);
    vec3 color = texture2D(texture0,uvSample).rgb;
    
    gl_FragColor = vec4(vec3(color),1);
}