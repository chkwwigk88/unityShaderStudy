using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SetUniformParam : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        GetComponent<Renderer>().material.SetVector("_appColor", new Vector4(0.8f, 0.8f, 0.8f, 1));
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
