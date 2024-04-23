// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/shader1"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma enable_d3d11_debug_symbols
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct v2f
            {   
                float4 pos : POSITION;
                float4 pos2 : POSITION1;
                //fixed4 color:COLOR;
            };


            v2f vert(in appdata_base v)
            {
                v2f o;
                 o.pos = v.vertex;
                //if(v.vertex.x == 0.5 && v.vertex.y == 0.5 && v.vertex.z == -0.5)
                //    o.color = fixed4(1,0,0,1);
                //else
                //    o.color = fixed4(0,1,0,1);
                float4 ff = float4(v.vertex.x,v.vertex.y,v.vertex.z,v.vertex.w);
                o.pos=UnityObjectToClipPos(v.vertex);
                o.pos2 = ff;
                return o;
            }

            fixed4 frag(v2f i):COLOR
            {
                if(i.pos2.x > 0 )
                    return fixed4(1,0,0,1);
                else
                    return fixed4(0,1,0,1);
                //return i.color;
            }
            ENDCG
        }
    }
}
