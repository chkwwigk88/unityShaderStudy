

Shader "Custom/arroundYRotation"
{
    SubShader
    {
        pass
        {
            CGPROGRAM
            #define UNITY_SHADER_NO_UPGRADE 1
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            struct v2f
            {
                float4 pos:POSITION;
                float4 col:COLOR;
            };

            v2f vert(appdata_base v)
            {
                float angle = length(v.vertex)*_SinTime.w;
                float4x4 m = {
                    float4(cos(angle),0,sin(angle),0),
                    float4(0,1,0,0),
                    float4(-sin(angle),0,cos(angle),0),
                    float4(0,0,0,1),
                };
                //m = mul(UNITY_MATRIX_MVP, m);
                v.vertex = mul(m,v.vertex);
                v2f o;
                o.pos = mul(UNITY_MATRIX_MVP,v.vertex);
                o.col = float4(0,1,1,1);
                return o;
            }

            float4 frag(v2f v):COLOR
            {
                return v.col;
            }
            ENDCG
        }
    }
}
