precision mediump float;
uniform vec4 uBlendFactor; //(texture0, texture1, texture2, color)
uniform vec4 uPaintColor;
uniform float uAlpha;
uniform vec2 uStep;
uniform float uMixAlpha;
uniform float uSharpenFactor;

uniform sampler2D sTexture;
varying vec2 vTexCoord;

vec4 sharpen(vec4 color, float factor) {
    vec2 step = uStep;
    vec3 sum = vec3(0.0, 0.0, 0.0);
    sum += texture2D(sTexture, vTexCoord + vec2(-0.5*step.x,     -step.y)).rgb - color.rgb;
    sum += texture2D(sTexture, vTexCoord + vec2(    -step.x,  0.5*step.y)).rgb - color.rgb;
    sum += texture2D(sTexture, vTexCoord + vec2(     step.x, -0.5*step.y)).rgb - color.rgb;
    sum += texture2D(sTexture, vTexCoord + vec2(     step.x,  0.5*step.y)).rgb - color.rgb;
    return vec4(color.rgb - 2.0 * factor * sum, color.a);
}

void main()
{
    vec4 color = vec4(0, 0, 0, 0);
    if (uBlendFactor.x > 0.05) {
        if (uSharpenFactor > 0.0) {
            color += sharpen(texture2D(sTexture, vTexCoord), uSharpenFactor) * uBlendFactor.x * uAlpha;
        } else {
            color += texture2D(sTexture, vTexCoord) * uBlendFactor.x * uAlpha;
        }
    }

    if (uBlendFactor.w > 0.05) {
        color += uPaintColor*uAlpha;
    }

    if(color.a < 0.01) {
        discard;
    }

    gl_FragColor = color;

    if (uMixAlpha >= 0.0) {
       gl_FragColor.a = uMixAlpha;
    }
}
