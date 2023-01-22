#version 150

uniform vec2 resolution;
uniform float brightness;
uniform float contrast;
uniform sampler2D texture0;


void main(void)
{
    vec2 uvSample = 1-gl_FragCoord.xy/resolution.xy;
    
    vec3 color = texture2D(texture0,uvSample).rgb;
    color = color - 0.5 * contrast + brightness;
    
    gl_FragColor = vec4(vec3(color),1);
}