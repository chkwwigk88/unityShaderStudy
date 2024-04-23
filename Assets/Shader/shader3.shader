// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/shader3"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            float dist;
            float r;

            struct v2f
            {
                float4 worldPos:POSITION;
                float4 col:COLOR;
            };

            v2f vert(appdata_base data)
            {
                v2f v;
                v.worldPos = UnityObjectToClipPos(data.vertex);
                float x = v.worldPos.x / v.worldPos.w;  //Í¸ÊÓ³ý·¨
                //if(x <= -1)
                //    v.col = float4(1,0,0,1);    
                //else if(x >=1)
                //    v.col = float4(0,1,0,1);
                //else
                //    v.col = float4(x/2 + 0.5,x/2+0.5,x/2+0.5,1);
                if(x >= dist && x <= dist + r)
                {
                    v.col = float4(1,0,0,1);
                }
                else
                {
                    v.col = float4(x/2 + 0.5,x/2+0.5,x/2+0.5,1);
                }
                return v;
            }

            float4 frag(v2f v):COLOR
            {
                return v.col;
            }
            ENDCG
        }

    }
    FallBack "Diffuse"
}
