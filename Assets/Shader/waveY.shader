

Shader "Custom/waveY"
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
                v2f o;
                //v.vertex.y += 0.2*sin(v.vertex.z*2+_Time.y);
                v.vertex.y+=0.2*sin(-length(v.vertex.xz)*2+_Time.y);
                o.pos = mul(UNITY_MATRIX_MVP,v.vertex);
                o.col = float4(v.vertex.y,v.vertex.y,v.vertex.y,1);
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
