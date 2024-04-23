// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/shader2"
{
    SubShader
    {
        pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            uniform float4 _appColor;
             void vert(float4 objpos:POSITION,out float4 pos:POSITION,out float4 obPos:POSITION1)
            {
                obPos = float4(objpos.x,objpos.y,0,1);
                pos = UnityObjectToClipPos(objpos);
                //pos = UnityObjectToClipPos(objpos);
                float4 col = pos;
                //return col;
            }

            float4 frag(float4 col:COLOR,float4 pp:POSITION1):COLOR
            {
                col = pp;
                //if(pp.y >= 0 && pp.x >= 0)
                //    col.x = 0.8;
                
                return col + _appColor;
            }
            ENDCG
        }
        
    }
}
