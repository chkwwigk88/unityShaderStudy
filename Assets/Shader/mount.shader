// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/mount"
{
    properties
    {
        _R("R",Range(1,3)) = 1
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float _R;
            struct v2f
            {
                float4 pos:POSITION;
                float4 col:COLOR;
            };

            v2f vert(appdata_base v)
            {
            float4 wpos = mul(unity_ObjectToWorld,v.vertex);
                float2 xy = wpos.xz;
                float d=_R-length(xy);
                d=d<0?0:d;
                float height = 1;
                float4 uppos=float4(v.vertex.x,height*d,v.vertex.z,v.vertex.w);
                v2f o;
                o.pos = UnityObjectToClipPos(uppos);
                o.col = float4(uppos.y,uppos.y,uppos.y,1);
                return o;
                //float dist = 3-length(v.vertex.xz);
                //dist = dist<0?0:dist;
                //float height = 1;

                //v2f v2;
                //v2.worldpos = UnityObjectToClipPos(float4(v.vertex.x,dist*height,v.vertex.z,v.vertex.w));
                //v2.col = float4(dist,dist,dist,1);
                //return v;
            }

            float4 frag(v2f v):COLOR
            {
                return v.col;
            }
            ENDCG
        }

    }
}
