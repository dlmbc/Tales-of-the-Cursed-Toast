-- https://www.youtube.com/watch?v=BkxN2pwwRPM 
-- shader tutorial on youtube

-- fixed struct 
Shader = [[
    #define NUM_LIGHTS 32

    struct Light {
        vec2 position;
        vec3 diffuse;
        float power;
        bool enabled;
    };

    extern Light lights[NUM_LIGHTS];

    extern vec2 screen;

    const float constant = 1.0;
    const float linear = 0.09;
    const float quadratic = 0.064;

    vec4 effect(vec4 color, Image image, vec2 uvs, vec2 screen_coords){
        vec4 pixel = Texel(image, uvs);
        pixel *= color;

        vec2 norm_screen = screen_coords / screen;
        vec3 diffuse = vec3(0);

        for (int i = 0; i < NUM_LIGHTS; i++) {
            if (lights[i].enabled) {
                Light light = lights[i];

                vec2 norm_pos = lights[i].position / screen;
                
                float distance = length(norm_pos - norm_screen) / (lights[i].power / 1000);
                float attenuation = 1.0 / (constant + linear * distance + quadratic * (distance * distance));
                diffuse += lights[i].diffuse * attenuation;
            }
        }

        diffuse = clamp(diffuse, 0.0, 1.0);

        return pixel * vec4(diffuse, 1.0);
    }
]]