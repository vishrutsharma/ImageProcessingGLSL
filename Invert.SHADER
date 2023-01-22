#version 150

uniform vec2 resolution;
uniform sampler2D texture0;

void main(void)
{
    vec2 uvSample = 1-gl_FragCoord.xy/resolution.xy;
    vec4 sampledColor = texture(texture0,uvSample);
    
    gl_FragColor =  vec4(1-sampledColor.x,1-sampledColor.y,1-sampledColor.z ,sampledColor.w);
}