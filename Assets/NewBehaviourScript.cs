using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NewBehaviourScript : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        for (int i = 0; i < 10; i++)
        {
            for (int j = 0; j < 10; j++)
            {
                float d = i - j;
                d = d / Math.Abs(d);
                d = d / 2 + 0.5f;

                Debug.Log("d:" + d);
            }
        }

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
