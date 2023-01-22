#version 150

uniform vec2 resolution;
uniform sampler2D texture0;
uniform sampler2D texture1;

void main(void)
{
    vec2 uvSample = 1-gl_FragCoord.xy/resolution.xy;
    vec3 sample0 = texture2D(texture0,uvSample).rgb;
    vec3 sample1 = texture2D(texture1,uvSample).rgb;
    
    vec3 color = vec3(1,1,1);
    color = sample0 + sample1; // Add
    color = sample0 - sample1; // Diff
    color = abs(sample0 -sample1); // Abs Diff
    color = sample0*sample1; // Mult
    color = sample0/sample1; // Div
    color = max(sample0,sample1); // Ligther
    color = min(sample0,sample1); // Darker
    
    gl_FragColor = vec4(color,1);
        
}